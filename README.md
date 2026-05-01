# StreamCost

> Cost observability for streaming data platforms — see exactly which Kafka topic, Flink job, or sink table is burning your budget.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Status](https://img.shields.io/badge/status-WIP%20%E2%80%94%20Phase%201-yellow)]()

## Status

🚧 **Under construction.** Phase 1 (local MVP) in progress.

## The Problem

Most streaming pipelines I see in production share one issue: nobody knows what each topic actually costs.

- Streaming engineers optimize for throughput and latency.
- Finance teams see one big AWS bill.
- Nobody connects the dots.

This is the FinOps gap of streaming platforms — and it's expensive.

## Roadmap

- [ ] **Phase 1** — Local MVP: Kafka → Flink → Iceberg + cost estimation v1
- [ ] **Phase 2** — Real cost engine + anomaly detection
- [ ] **Phase 3** — AWS deployment + custom UI
- [ ] **Phase 4** — Open source release + conference talk

## Author

Built by [Rodolfo Frois](https://www.linkedin.com/in/rodolfo-frois/) — Senior Data Engineer & Team Lead.

## License

MIT
