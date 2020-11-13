USE cfn_security
go

SELECT object_name(sys.all_sql_modules.object_id) as Name, definition as Code
                from sys.all_sql_modules inner join sys.objects ON 
                sys.all_sql_modules.object_id = sys.objects.object_id
                where objectproperty(sys.all_sql_modules.object_id, 'IsProcedure') = 1 AND is_ms_shipped = 0 and uses_ansi_nulls = 0
            ORDER BY Name 