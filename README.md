# CU entity-resolution fixture

This public repository is a deliberately small dbt project for testing catalog-driven lineage resolution in Clear Fracture Code Understanding.

It describes one lineage edge:

```text
learning_hive.cu_fixture.raw_orders
  -> learning_hive.cu_fixture.order_summary
```

Both tables must already exist in OpenMetadata as ordinary Postgres entities before running Code Understanding in enforced catalog-resolution mode. Code Understanding should resolve the schema-qualified names against the supplied catalog snapshot; it must not create custom table entities.

## Contents

- `models/sources.yml` declares the existing Postgres source table.
- `models/order_summary.sql` contains the transformation and lineage signal.
- `profiles.yml` supplies non-secret database and schema hints to static analysis. Runtime credentials are environment-variable placeholders and are never committed.

## Expected result

A fresh CU lineage run should report a complete catalog snapshot and a validated edge from `raw_orders` to `order_summary`. If either table has not been ingested into OpenMetadata, enforced mode should report the edge as unresolved with `fqn_absent` and perform no lineage write.
