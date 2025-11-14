`dbt --select source:airbnb.listings`

Analyses in dbt are **ad-hoc SQL queries** that do not get materialized in the cloud data warehouse, they do in the analyses folder and to compile them run `dbt compile`

`target\compiled\dbtlearn\analyses`

`dbt docs generate` - command generated a lightweight documentation of the dbt project

`dbt docs serve` - serves the documentation as an HTML page  
  
Either add description: in `schema.yml` file as it is or make a reference `('{{ doc("_name_of_the_docs_") }}')` to `models\docs.md` file to write a more sophisticated markdown description

Custom Generic Tests go in the tests\\generic folder

You can also add however many parameters you want in a custom generic test

Data Contracts - created contracts in schema.yml file.

1.  config:
2.        contract:
3.          enforced: true

Do some more R&D on Unit tests

Third-party packages go into the packages.yml file and run `dbt deps` to install

dbt Tests - Data Quality

Singular tests and Generic tests

Singular tests are SQL queries stored in tests which are expected to return an empty query set, if doesn't return an empty query set then -> test failed

4 Built-in Generic tests

unique, not\_null, accepted\_values, Relationships

How Type-2 Slowly Changing Dimensions are handled in dbt

dbt adds two additional columns `dbt_valid_from` and `dbt_valid_to` to keep track of historical and current data. dbt makes a new record with the updated data but keeps the previous record by having the updated at time in the dbt\_valid\_to space.

Reference RAW tables as source tables, **add an extra layer of abstraction** on top of RAW database schema. Create a `sources.yml` file in models folder  
  
In our `src` files instead of directly making a reference to Snowflake schema we use **ref tags** `{{ source() }}`.  
  
`dbt compile` command to check

`mart` folder under `models` contains the tables that are accessible by BI tools

`dbt seed` command to import seed files (csv) to snowflake

After making the staging layer src files as **ephemeral materialization** it becomes a **CTE**, not a view or a table, you cant view it in snowflake. dbt internally complies it check `target/run/dbtlearn/models/` files

`dbt run --full-refresh` rebuild all the tables/views