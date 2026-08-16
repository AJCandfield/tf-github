# Linear integration (future, non-MCP)

Linear is not configured or contacted by this project, and no Linear credentials are assumed. A later integration should use Linear's GraphQL API and webhooks through a small, explicitly authenticated adapter or GitHub Actions workflow—not an MCP server.

The adapter should receive a webhook for a narrowly selected issue transition, verify the webhook signature, and use a short-lived or repository-scoped secret stored in the deployment secret manager. It should query the issue over GraphQL, apply an allowlist of labels/team/project fields, and enqueue a bounded task payload. Tokens must be supplied through environment/secret injection, never committed or logged.

A Linear issue becomes a bounded subagent task only after the adapter records the issue identifier, repository, requested files/scope, acceptance checks, and timeout. The worker must return a reviewable branch/commit and validation result; it must not infer cloud billing, namespace, workspace, or credential values. Human review remains required before merge or infrastructure mutation. Retry, deduplication, and cancellation handling should be defined before enabling the workflow.
