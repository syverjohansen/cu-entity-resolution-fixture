# Entity Resolution Fixture

This repository contains a compact dbt project for exploring how SQL model metadata can be compared with a data catalog.

## Project files

- `models/sources.yml` contains the project source declaration and column descriptions.
- `models/order_summary.sql` contains the model query.
- `dbt_project.yml` configures the project and model defaults.
- `profiles.yml` contains local connection settings that read credentials from environment variables.

## Local inspection

The project files can be reviewed without starting dbt or connecting to a database. To check the SQL and YAML with local tooling, use the parsers already installed in your environment. Runtime credentials are not included in this repository.
