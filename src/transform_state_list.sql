COPY (

	SELECT DISTINCT
		State_ID
		,State_Name_CAT
	FROM 'output/state_observations.parquet'
	ORDER BY State_ID

) TO 'output/state_list.parquet' (FORMAT PARQUET);


