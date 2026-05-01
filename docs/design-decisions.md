# Design Decisions

A running log of non-obvious technical choices and the rationale behind them. Keeping this updated is mandatory — recruiters and reviewers read this to understand how the engineer thinks.

## Decision log

### 1. Kafka in KRaft mode (no Zookeeper)

**Date:** 2026-05-01
**Phase:** 1, Week 1

**Decision:** Run Kafka in KRaft mode (single-node, combined broker + controller) instead of the classic Kafka + Zookeeper setup.

**Why:**
- KRaft has been GA since Confluent Platform 7.5 (October 2023) and is the default in CP 7.6+.
- Zookeeper removal is the long-term direction of the Apache Kafka project (KIP-500). Using ZK in 2026 signals lagging behind.
- One less container — meaningful when running the full stack (Kafka + Flink + Iceberg + observability) on a developer laptop.
- Operational model is closer to what production looks like in Confluent Cloud and AWS MSK Serverless.

**Trade-off:**
- Some older tutorials and Stack Overflow answers assume ZK. Easily worked around — KRaft has been mainstream for 2+ years by the time of this project.

### 2. Schema Registry on port 8085 (not the default 8081)

**Date:** 2026-05-01
**Phase:** 1, Week 1

**Decision:** Expose Schema Registry on `localhost:8085` instead of the upstream default `8081`.

**Why:**
- Apache Flink's Web UI defaults to port 8081 and will be added to the stack in Week 3.
- Cheaper to relocate Schema Registry once now than to refactor when Flink is introduced.
- 8085 is a common alternative seen in Confluent's own examples.

**Trade-off:**
- Anyone copying snippets from upstream Confluent docs will need to substitute 8085 for 8081. Documented in the README and in the Makefile.
