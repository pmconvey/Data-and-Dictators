COPY ( -- Writing output of the query to a parquet file

WITH cow_list AS (
	-- Loading Correlates of War (COW) state list
	SELECT DISTINCT
		CCode
		,StateNme
	FROM 'data/cow_states.parquet'
),

gw_list AS (
	-- Loading Gleditsch and Ward (GW) state list and making edits so it is
	-- consistent with COW
	SELECT DISTINCT
		-- Kiribati, Nauru, Tonga, and Tuvalu are coded differently between GW
		-- and COW; changing the codes in GW to match COW
		CASE
			WHEN statenumber=970 THEN 946 --Kiribati
			WHEN statenumber=971 THEN 970 --Nauru
			WHEN statenumber=972 THEN 955 --Tonga
			WHEN statenumber=973 THEN 947 --Tuvalu
			ELSE statenumber
			END AS statenumber
		,countryname
		,COLUMNS('start')
		,COLUMNS('end')
	FROM 'data/gw_states.parquet'
),

state_list AS (
	-- Joining GW and COW state lists
	SELECT
		COALESCE(cw.CCode, gw.statenumber) AS State_ID
		,COALESCE(cw.StateNme, gw.countryname) AS State_Name_CAT
		-- GW codes North Yemen (678) as the state that continues when North
		-- and South Yemen (680) unified in 1990. COW codes the unified state
		-- as a new state (679). Adjusting the start and end dates for those
		-- two states to match the COW coding scheme.
		,CASE
			WHEN cw.CCode=679 THEN make_date(1990,05,22)
			ELSE CAST(gw.start AS DATE)
			END AS State_Obs_Start_DT
		,CASE
			WHEN gw.statenumber=678 THEN make_date(1990,5,21)
			WHEN cw.CCode=679 THEN make_date(2020,12,31)
			ELSE CAST(gw.end AS DATE)
			END AS State_Obs_End_DT
	FROM cow_list AS cw
	FULL JOIN gw_list AS gw ON cw.CCode=gw.statenumber
)

--Creating a unique identifier for the data set
SELECT
	(ROW_NUMBER() OVER(PARTITION BY State_ID
                       ORDER BY State_Obs_Start_DT))
		*1000+State_ID AS State_Obs_ID
	,State_ID
	,State_Name_CAT
	,State_Obs_Start_DT
	,State_Obs_End_DT
FROM state_list
ORDER BY State_ID, State_Obs_Start_DT

) TO 'output/state_observations.parquet' (FORMAT PARQUET);


