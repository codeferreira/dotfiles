---
name: "ops-infra-infra-status"
description: "Comprehensive Talos Kubernetes cluster health monitoring with parallel infrastructure analysis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$ops-infra-infra-status`.
- Treat all user text after `$ops-infra-infra-status` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `ops:infra:infra-status`.
- Codex invocation: `$ops-infra-infra-status`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Check target: {{SC_ARGS}} (optional - specific component: nodes, pods, services, storage, network, all)

## Your spawn_agent

STEP 1: Initialize infrastructure health monitoring session

- CREATE session state file: `/tmp/infra-status-$SESSION_ID.json`
- DETERMINE check scope from {{SC_ARGS}} (default: comprehensive)
- VALIDATE kubectl access and cluster connectivity
- INITIALIZE health status tracking structure

```bash
# Initialize infrastructure monitoring session
echo '{
  "sessionId": "'$SESSION_ID'",
  "timestamp": "'$(gdate -Iseconds 2>/dev/null || date -Iseconds)'",
  "checkScope": "'${ARGUMENTS:-all}'",
  "clusterStatus": "unknown",
  "infrastructureServices": {},
  "criticalIssues": [],
  "healthScore": 0
}' > /tmp/infra-status-$SESSION_ID.json
```

STEP 2: Adaptive monitoring strategy based on check scope and cluster complexity

TRY:

CASE check_scope:
WHEN "nodes":

- EXECUTE focused node health analysis
- CHECK resource utilization and readiness
- VALIDATE control plane and worker node status

WHEN "pods":

- ANALYZE pod health across all namespaces
- CHECK resource consumption and limits
- IDENTIFY stuck or failing pods

WHEN "services" OR "infrastructure":

- LAUNCH parallel sub-agents for comprehensive infrastructure analysis
- COORDINATE health checks across all preferred services
- SYNTHESIZE status from parallel execution

WHEN "storage":

- CHECK persistent volume status and capacity
- ANALYZE storage class configurations
- VALIDATE backup and replication status

WHEN "network":

- VALIDATE CNI functionality and connectivity
- CHECK service mesh and ingress health
- ANALYZE network policies and security

WHEN "all" OR empty:

- EXECUTE comprehensive infrastructure health audit
- USE parallel sub-agents for optimal performance
- PROVIDE executive summary with priority recommendations

**Focused Component Analysis:**

```bash
# Quick node health check
echo "🔍 Node Health Analysis:"
kubectl get nodes -o json | jq -r '.items[] | "\(.metadata.name): \(.status.conditions[] | select(.type=="Ready") | .status)"'

# Resource utilization with error handling
echo "📊 Resource Utilization:"
kubectl top nodes --use-protocol-buffers=false 2>/dev/null || echo "⚠️ Metrics server unavailable"
kubectl top pods --all-namespaces --use-protocol-buffers=false 2>/dev/null | head -10 || echo "⚠️ Pod metrics unavailable"

# Critical system pods
echo "🏗️ Critical System Pods:"
kubectl get pods -n kube-system -o json | jq -r '.items[] | select(.metadata.name | test("(etcd|api-server|controller|scheduler)")) | "\(.metadata.name): \(.status.phase)"'
```

STEP 3: Parallel infrastructure service monitoring with sub-agent coordination

IF check_scope includes "services" OR "all":

LAUNCH parallel sub-agents for comprehensive infrastructure health analysis:

- **Agent 1: Postgres Database Health**: Monitor database cluster status, replication, and performance
  - Focus: Connection health, replication lag, storage utilization, backup status
  - Tools: kubectl with postgres-system namespace analysis, connection testing
  - Output: Database cluster health report with performance metrics

- **Agent 2: DragonflyDB Cache Analysis**: Analyze cache performance and memory utilization
  - Focus: Memory usage, hit rates, cluster connectivity, eviction policies
  - Tools: kubectl with dragonfly-system namespace monitoring, performance analysis
  - Output: Cache system health report with optimization recommendations

- **Agent 3: RedPanda Streaming Health**: Monitor streaming service and partition status
  - Focus: Topic health, partition distribution, consumer lag, broker status
  - Tools: kubectl with redpanda-system namespace analysis, topic validation
  - Output: Streaming infrastructure health with throughput analysis

- **Agent 4: ScyllaDB NoSQL Status**: Analyze NoSQL cluster consistency and performance
  - Focus: Node health, repair status, data consistency, query performance
  - Tools: kubectl with scylla-system namespace monitoring, cluster analysis
  - Output: NoSQL cluster health with consistency validation

- **Agent 5: Storage & Networking**: Monitor persistent volumes, CNI, and service mesh
  - Focus: PV status, storage capacity, network policies, ingress health
  - Tools: kubectl storage and network resource analysis, connectivity testing
  - Output: Infrastructure foundation health with capacity planning

**Sub-Agent Coordination:**

```bash
# Each agent reports findings to session state
echo "Launching parallel infrastructure health analysis..."
echo "Agents will analyze: Database, Cache, Streaming, NoSQL, and Foundation layers"
echo "Results will be aggregated into comprehensive health dashboard"
```

STEP 4: Health scoring and intelligent issue prioritization

TRY:

**Health Score Calculation:**

```bash
# Calculate comprehensive health score (0-100)
node_health=$(kubectl get nodes --no-headers | grep -c Ready || echo 0)
total_nodes=$(kubectl get nodes --no-headers | wc -l || echo 1)
failing_pods=$(kubectl get pods -A --no-headers | grep -c -E '(Error|CrashLoopBackOff|ImagePullBackOff)' || echo 0)
total_pods=$(kubectl get pods -A --no-headers | wc -l || echo 1)

# Update session state with health metrics
jq --argjson node_health "$node_health" \
   --argjson total_nodes "$total_nodes" \
   --argjson failing_pods "$failing_pods" \
   --argjson total_pods "$total_pods" \
   '.healthMetrics = {
     "nodeHealthRatio": ($node_health / $total_nodes),
     "podHealthRatio": (($total_pods - $failing_pods) / $total_pods),
     "timestamp": now
   }' /tmp/infra-status-$SESSION_ID.json > /tmp/infra-status-$SESSION_ID.tmp && \
mv /tmp/infra-status-$SESSION_ID.tmp /tmp/infra-status-$SESSION_ID.json
```

**Critical Issue Detection:**

```bash
# Identify critical issues requiring immediate attention
echo "🚨 Critical Issue Analysis:"

# Control plane health
kubectl get componentstatuses 2>/dev/null || echo "⚠️ Component status unavailable"

# Resource exhaustion detection
echo "💾 Resource Exhaustion Check:"
kubectl describe nodes | grep -E '(OutOfmemory|OutOfcpu|OutOfStorage)' || echo "✅ No resource exhaustion detected"

# Failed/stuck pods
echo "🔄 Failed Pod Analysis:"
kubectl get pods -A --field-selector=status.phase!=Running,status.phase!=Succeeded 2>/dev/null | head -10 || echo "✅ No failed pods detected"
```

CATCH (monitoring_failed):

- LOG error details to session state
- PROVIDE offline diagnostics and troubleshooting guidance
- SUGGEST alternative monitoring approaches

```bash
echo "⚠️ Infrastructure monitoring failed. Checking cluster accessibility:"
echo "Kubectl context: $(kubectl config current-context 2>/dev/null || echo 'Not configured')"
echo "Cluster reachability: $(kubectl cluster-info --request-timeout=3s 2>/dev/null && echo '✅ Reachable' || echo '❌ Unreachable')"
echo "Suggested actions:"
echo "  1. Verify kubectl configuration: kubectl config view"
echo "  2. Check cluster status: kubectl get nodes"
echo "  3. Validate network connectivity to cluster"
```

STEP 5: Executive dashboard generation and actionable recommendations

**Infrastructure Health Dashboard:**

```bash
echo "📊 TALOS KUBERNETES INFRASTRUCTURE HEALTH DASHBOARD"
echo "═══════════════════════════════════════════════════════"
echo "Session: $SESSION_ID"
echo "Timestamp: $(gdate -Iseconds 2>/dev/null || date -Iseconds)"
echo "Check Scope: ${ARGUMENTS:-comprehensive}"
echo ""

# Cluster overview
echo "🏗️ CLUSTER OVERVIEW"
echo "Nodes: $(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d ' ') total"
echo "Pods: $(kubectl get pods -A --no-headers 2>/dev/null | wc -l | tr -d ' ') running"
echo "Namespaces: $(kubectl get namespaces --no-headers 2>/dev/null | wc -l | tr -d ' ') active"
echo ""

# Modern infrastructure services status
echo "🔧 MODERN INFRASTRUCTURE SERVICES"
echo "Postgres: $(kubectl get pods -n postgres-system --no-headers 2>/dev/null | grep -c Running || echo 0)/$(kubectl get pods -n postgres-system --no-headers 2>/dev/null | wc -l || echo 0) pods ready"
echo "DragonflyDB: $(kubectl get pods -n dragonfly-system --no-headers 2>/dev/null | grep -c Running || echo 0)/$(kubectl get pods -n dragonfly-system --no-headers 2>/dev/null | wc -l || echo 0) pods ready"
echo "RedPanda: $(kubectl get pods -n redpanda-system --no-headers 2>/dev/null | grep -c Running || echo 0)/$(kubectl get pods -n redpanda-system --no-headers 2>/dev/null | wc -l || echo 0) pods ready"
echo "ScyllaDB: $(kubectl get pods -n scylla-system --no-headers 2>/dev/null | grep -c Running || echo 0)/$(kubectl get pods -n scylla-system --no-headers 2>/dev/null | wc -l || echo 0) pods ready"
echo ""
```

FINALLY:

- SAVE comprehensive health report to session state
- PROVIDE actionable recommendations based on findings
- SUGGEST monitoring automation and alerting improvements

**Session Summary:**

```bash
echo "✅ Infrastructure health check completed"
echo "🎯 Target: ${ARGUMENTS:-comprehensive analysis}"
echo "⏱️ Session: $SESSION_ID"
echo "💾 Report cached in: /tmp/infra-status-$SESSION_ID.json"
echo "📈 Overall Status: $(jq -r '.healthScore // "Calculating..."' /tmp/infra-status-$SESSION_ID.json 2>/dev/null)"
```

## Advanced Infrastructure Monitoring Patterns

### Component-Specific Health Checks

**Node Health Deep Dive:**

```bash
# Comprehensive node analysis
kubectl get nodes -o json | jq -r '.items[] | {
  name: .metadata.name,
  ready: (.status.conditions[] | select(.type=="Ready") | .status),
  cpu_capacity: .status.capacity.cpu,
  memory_capacity: .status.capacity.memory,
  kernel: .status.nodeInfo.kernelVersion,
  talos_version: .status.nodeInfo.osImage
}'
```

**Service Mesh Health:**

```bash
# CNI and networking validation
kubectl get pods -n kube-system -l k8s-app=cilium -o json | jq -r '.items[] | "\(.metadata.name): \(.status.phase)"'
kubectl get ciliumnodes 2>/dev/null | head -5 || echo "Cilium CRDs not available"
```

**Resource Utilization Trending:**

```bash
# Resource consumption patterns
kubectl top nodes --sort-by cpu --no-headers 2>/dev/null | head -3
kubectl top pods -A --sort-by cpu --no-headers 2>/dev/null | head -5
```

### Troubleshooting Automation

**Auto-Remediation Suggestions:**

- Failed pods: Automatic restart recommendations
- Resource exhaustion: Scale-out or resource optimization guidance
- Network issues: CNI and service mesh diagnostic procedures
- Storage problems: Volume expansion and cleanup strategies

### Example Usage Scenarios

```bash
# Comprehensive infrastructure audit
/infra-status

# Focus on specific infrastructure layer
/infra-status nodes
/infra-status services 
/infra-status storage
/infra-status network

# Modern infrastructure services health
/infra-status postgres
/infra-status dragonfly
/infra-status redpanda
/infra-status scylla

# Emergency response mode
/infra-status all
```

This command provides comprehensive Talos Kubernetes infrastructure monitoring with intelligent analysis, parallel sub-agent coordination for complex environments, and actionable recommendations for maintaining optimal cluster health.
