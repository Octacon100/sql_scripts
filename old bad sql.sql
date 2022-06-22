SELECT TOP(1)
'
SELECT
dtc.data_test_case_id,
dt.test_class,
dt.test_name,
' + dtc.input.query('for $parameter in ./parameter
return string
(
concat
(
"dtc.input.query
(
''(parameter/value[../name ="",
$parameter/name[1],
""])''
).value(''.'', ''VARCHAR(MAX)'') as ",
$parameter/name[1],
",&#xa;"
)
)').value('.', 'VARCHAR(MAX)') + '
' + dtc.expected_output.query('for $output in ./output
return string
(
concat
(
"dtc.expected_output.query
(
''(output/value[../name ="",
$output/name[1],
""])''
).value(''.'', ''VARCHAR(MAX)'') as expected_",
$output/name[1],
if (($output)[position()] = (./output)[last()])
then ""
else ",&#xa;"
)
)').value('.', 'VARCHAR(MAX)') + '
INTO #test_table_' + CAST(dt.data_test_id AS varchar(10)) + '
FROM data_quality.data_test dt
INNER JOIN data_quality.data_test_case dtc ON
dt.data_test_id = dtc.data_test_id' as col
FROM data_quality.data_test dt_select
INNER JOIN data_quality.data_test_case dtc ON
dt_select.data_test_id = dt.data_test_id
)