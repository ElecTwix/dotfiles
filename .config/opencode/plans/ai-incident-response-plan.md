# Task: AI-Powered Incident Response Assistant

## Multi-Agent Orchestration Directive Compliance Blueprint

### State Machine Blueprint
| State | Owning Agent | Purpose | Entry Condition | Exit Condition | Forward Transition | Loop-Back Trigger |
| --- | --- | --- | --- | --- | --- | --- |
| Initialization | `adaptive-orchestrator` | Confirm charter, incident metrics baseline, and operating guardrails | Sponsoring leadership delivers charter and grants system access | Orientation brief circulated; roles, metrics, and communication cadence ratified | → Phase 1: Incident Intelligence Capture | Missing approvals, unclear success criteria, or tooling access gaps |
| Phase 1: Incident Intelligence Capture | `prompt-engineer` | Distill objectives, data sources, and severity models into reusable prompt-ready artifacts | Initialization artifacts accepted and stakeholder roster confirmed | Intelligence packet, risk log v1, and scenario severity matrix approved by sponsors | → Phase 2: Response Playbook Engineering | Stakeholder dissent, data integrity defects, or severity model ambiguity |
| Phase 2: Response Playbook Engineering | `golang-pro` | Engineer modular response flows, integration contracts, and automation hooks | Phase 1 deliverables baselined and prioritized scenarios ranked | Integration specification, automation stubs, and prompt workflow baseline validated | → Phase 3: Pilot Instrumentation & Tuning | Failed integration tests, unresolved latency/security concerns, or unapproved contracts |
| Phase 3: Pilot Instrumentation & Tuning | `golang-pro` | Configure pilot environment, monitoring, and feedback loops with prompt stress-testing | Phase 2 assets approved; pilot cohort identified; monitoring stack available | Pilot readiness checklist cleared, dashboards live, prompt guardrails validated with `prompt-engineer` sign-off | → Operational Pilot Launch (out of scope) | Monitoring gaps, readiness checklist failures, or prompt accuracy < 85% |
| Escalation Review | `adaptive-orchestrator` | Realign agents on mitigations, trade-offs, and revised timelines | Triggered by escalation thresholds in any state | Mitigation plan agreed, ownership assigned, and timelines reset | Return to originating state with updated playbook | Mitigation stalls or new critical risk emerges |

### Phase Breakdown
**Phase 1 – Incident Intelligence Capture (`prompt-engineer` lead)**
- Objectives: capture stakeholder goals, confirm incident taxonomy, and codify data provenance requirements.
- Key Activities: structured stakeholder dialogues, telemetry source audit, severity tier mapping, risk register creation.
- Deliverables: intelligence packet, scenario ladder, annotated data inventory, risk log v1.
- Dependencies: charter approvals, access to historical incident transcripts, security liaison availability.
- Gate to Exit: executive sponsor approves intelligence packet; risk owners acknowledged; severity ladder validated by security.

**Phase 2 – Response Playbook Engineering (`golang-pro` lead)**
- Objectives: define modular assistant architecture, interface contracts, and executable prompt workflows.
- Key Activities: service boundary design, integration stub creation, latency budgeting, co-authoring prompts with `prompt-engineer`.
- Deliverables: architecture diagram, integration contract matrix, automation stubs, prompt workflow catalog with fallback traces.
- Dependencies: prioritized scenarios, vetted data sources, compliance requirements, sandbox credentials.
- Gate to Exit: architecture review passed; integration tests green; prompt workflows achieve ≥ 90% scenario coverage in dry runs.

**Phase 3 – Pilot Instrumentation & Tuning (`golang-pro` lead with `prompt-engineer` pairing)**
- Objectives: operationalize pilot, enable monitoring, and iterate prompts based on live rehearsal feedback.
- Key Activities: deploy pilot infrastructure, configure observability dashboards, execute rehearsal drills, refine prompts for edge cases.
- Deliverables: pilot operations playbook, monitoring dashboards, rehearsal findings log, updated prompt guardrails.
- Dependencies: approved integration assets, pilot cohort commitment, analytics tooling.
- Gate to Exit: readiness checklist cleared; rollback plan tested; rehearsal defects closed or risk-accepted by sponsors.

### Parallel Workstreams
- Incident Knowledge Capture (`prompt-engineer`): structure stakeholder insights into scenario narratives and prompt-ready datasets while cataloging data provenance.
- Automation & Integration Stream (`golang-pro`): build and validate integration contracts, automation stubs, and telemetry adapters alongside prompt workflows.
- Resilience & Monitoring Overlay (`golang-pro` + `prompt-engineer` pairing): co-develop observability dashboards and guardrail prompts to enforce safe responses during pilot rehearsals.

### Assigned Sub-Agents
| Workstream | Lead Agent Type | Mandate | Dependencies |
| --- | --- | --- | --- |
| Orchestration & Governance | `adaptive-orchestrator` | Coordinate phases, manage checkpoints, enforce decision logs, and arbitrate trade-offs | Charter clarity, stakeholder availability |
| Incident Intelligence & Prompt Modeling | `prompt-engineer` | Capture requirements, craft scenario libraries, and align guardrail prompts with policies | Stakeholder interviews, historical incident data |
| Automation Architecture & Integration | `golang-pro` | Produce architecture, interfaces, automation hooks, and observability integrations | Platform standards, sandbox access |
| Pilot Instrumentation & Continuous Tuning | `golang-pro` (paired with `prompt-engineer`) | Stand up pilot environment, ensure monitoring readiness, and iterate prompts based on telemetry | Approved playbooks, monitoring stack |

### Risks & Mitigations
- Fragmented stakeholder narratives may skew prompt scenarios; mitigation: `prompt-engineer` runs alignment workshops with executive summaries for sign-off.
- Integration latency could exceed incident SLAs; mitigation: `golang-pro` establishes latency budgets and auto-tests with performance thresholds per interface.
- Monitoring blind spots could hide automation regressions; mitigation: `golang-pro` deploys synthetic incident probes with real-time alerting before pilot launch.
- Prompt drift during pilot may erode operator trust; mitigation: `prompt-engineer` schedules rapid review cadences and maintains a guardrail change log.

### Next Feedback Checkpoint
- 2025-10-17 pilot readiness sync led by `adaptive-orchestrator`; agenda: risk log deltas, integration test status, prompt coverage metrics, and go/no-go gating decisions.

### Escalation Notes
- Escalation thresholds: unresolved blockers > 48 hours, risk severity escalates to critical, or compliance review fails twice.
- Primary path: `adaptive-orchestrator` invokes Escalation Review, convenes `golang-pro` and `prompt-engineer`, and notifies executive sponsor with mitigation timeline.
- Document outcomes in the shared orchestration log; update state machine tracker immediately after decisions.

### Execution Delegation Templates
#### Phase 1 Delegation Template (`prompt-engineer`)
```text
Objective: Convert incident context into actionable scenario narratives and guardrail requirements.
Inputs: Charter, stakeholder roster, historical incidents, compliance guardrails.
Actions: Conduct interviews, structure severity ladder, log data sources, capture prompt constraints.
Deliverables: Intelligence packet, scenario ladder, annotated data inventory, risk log v1.
Guardrails: Tag any unverified data source; request `golang-pro` validation before integration use.
Escalation: Alert `adaptive-orchestrator` if stakeholder alignment fails or data integrity issues persist beyond one business day.
```

#### Phase 2 Delegation Template (`golang-pro`)
```text
Objective: Engineer modular response playbooks, integrations, and automation scaffolding aligned to incident objectives.
Inputs: Intelligence packet, scenario ladder, compliance requirements, sandbox credentials.
Actions: Draft architecture diagram, build integration stubs, pair with `prompt-engineer` on prompts, run latency and security tests.
Deliverables: Architecture deck, integration contract matrix, automation stubs, prompt workflow catalog.
Guardrails: Enforce agreed schemas; maintain latency budgets; document assumptions in decision log.
Escalation: Engage `adaptive-orchestrator` when integration blockers exceed 24 hours or compliance reviewers request rework.
```

#### Phase 3 Delegation Template (`golang-pro` with `prompt-engineer` pairing)
```text
Objective: Operationalize the pilot environment, ensure monitoring coverage, and iterate prompts from rehearsal insights.
Inputs: Approved architecture, automation stubs, monitoring tooling, rehearsal schedule.
Actions: Deploy pilot infrastructure, configure dashboards, run rehearsal drills, capture prompt performance analytics with `prompt-engineer` insights.
Deliverables: Pilot operations playbook, monitoring dashboards, rehearsal findings log, updated prompt guardrails.
Guardrails: Validate rollback plan, maintain incident audit trail, ensure prompt changes are versioned.
Escalation: Trigger Escalation Review if readiness checklist fails twice or telemetry gaps persist.
```

### Feedback Templates
- **Daily Triage Pulse (10 min)**
  - Agenda: overnight incidents, blocker status, decision needs.
  - Inputs: prompt accuracy snapshot (`prompt-engineer`), integration health metrics (`golang-pro`).
  - Output: prioritized action list with owners and due times.

- **Architecture & Prompt Review (45 min)**
  - Sections: integration contract assessment, latency variance, prompt guardrail evaluation, approval vote.
  - Owner: `golang-pro`; `prompt-engineer` documents prompt-specific follow-ups and distributes minutes.

- **Pilot Retrospective Survey**
  - Questions: MTTA/MTTR delta, operator satisfaction, automation success rate, observed prompt misfires.
  - Owner: `adaptive-orchestrator`; responses tagged for action by `golang-pro` or `prompt-engineer` within 48 hours.

### Loop-Back Conditions
- Re-enter Phase 1 if new incident classes emerge or core data sources are revoked.
- Re-enter Phase 2 if integration tests regress, compliance flags a contract, or prompt workflows drop below 90% coverage.
- Restart Phase 3 if pilot rehearsals surface unmitigated severity-tier gaps or monitoring alerts breach SLA.
- Invoke Escalation Review whenever mitigation timelines slip or risk severity upgrades to critical.

### Next Steps
- `adaptive-orchestrator`: finalize checkpoint agenda and circulate decision log template by 2025-10-15.
- `prompt-engineer`: complete severity ladder validation interviews and publish intelligence packet draft by 2025-10-16.
- `golang-pro`: deliver integration contract skeleton and latency budget outline for review ahead of the 2025-10-17 sync.
- Joint (`golang-pro` + `prompt-engineer`): align on prompt coverage analytics and rehearsal metrics definition before pilot instrumentation begins.
