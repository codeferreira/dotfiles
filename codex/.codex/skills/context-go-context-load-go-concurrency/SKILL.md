---
name: "context-go-context-load-go-concurrency"
description: "Systematic Go concurrency documentation loading with comprehensive context analysis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$context-go-context-load-go-concurrency`.
- Treat all user text after `$context-go-context-load-go-concurrency` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `context:go:context-load-go-concurrency`.
- Codex invocation: `$context-go-context-load-go-concurrency`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# /context-load-go-concurrency

## Context


## Your spawn_agent

STEP 1: Context Loading Session Initialization

Think deeply about optimal Go concurrency documentation loading strategies and comprehensive pattern analysis.

- Initialize context loading session: /tmp/context-go-concurrency-$SESSION_ID.json
- Detect Go project characteristics and existing concurrency patterns
- Create systematic documentation loading plan
- Save checkpoint: session_initialized

```json
// /tmp/context-go-concurrency-$SESSION_ID.json
{
  "sessionId": "$SESSION_ID",
  "target": "go-concurrency-patterns",
  "phase": "initialization",
  "project_context": {
    "has_go_files": false,
    "go_version": "unknown",
    "existing_patterns": [],
    "complexity_level": "unknown"
  },
  "loaded_sources": [],
  "context_analysis": {
    "patterns_covered": [],
    "examples_loaded": 0,
    "documentation_depth": "basic"
  },
  "checkpoints": {
    "session_initialized": "complete",
    "context_loading": "pending",
    "analysis_complete": "pending"
  }
}
```

STEP 2: Systematic Documentation Source Loading

TRY:

- Use Context7 MCP server for structured Go concurrency documentation
- Load comprehensive documentation from authoritative sources
- Process and analyze documentation for pattern extraction
- Update session state with loaded context

**Primary Documentation Sources Loading:**

FOR EACH source IN priority_sources:

1. **Go Official Documentation** (Context7 Integration):
   - Resolve Go library ID for concurrency documentation
   - Load comprehensive Go concurrency context
   - Focus on: goroutines, channels, select, context package

2. **Go by Example - Concurrency Patterns**:
   - URL: `https://gobyexample.com/`
   - Focus areas: goroutines, channels, select, worker pools, rate limiting
   - Extract executable examples and pattern analysis

3. **Effective Go - Concurrency Section**:
   - URL: `https://go.dev/doc/effective_go`
   - Focus areas: concurrency best practices, channel idioms, goroutine management

4. **Go Blog - Advanced Concurrency**:
   - URL: `https://go.dev/blog/`
   - Focus areas: concurrency patterns, pipelines, cancellation, context usage

5. **Go Concurrency Patterns Presentation**:
   - URL: `https://go.dev/talks/2012/concurrency.slide`
   - Focus areas: advanced patterns, select statement mastery, cancellation patterns

6. **Sync Package Documentation**:
   - URL: `https://pkg.go.dev/sync`
   - Focus areas: mutexes, wait groups, atomic operations, once patterns

Update session state after each successful source load.

CATCH (context7_unavailable):

- Fall back to WebFetch tool for direct documentation loading
- Continue with available documentation sources
- Document missing Context7 capabilities in session state

CATCH (documentation_load_failure):

- Log failed sources in session state
- Continue with available documentation
- Provide manual documentation loading guidance

STEP 3: Concurrency Pattern Analysis and Extraction

Think harder about Go concurrency pattern categorization and practical application strategies.

- Analyze loaded documentation for key concurrency patterns
- Extract executable code examples and best practices
- Categorize patterns by complexity and use case
- Create comprehensive pattern reference

**Pattern Categories to Extract:**

1. **Basic Goroutine Patterns**:
   - Goroutine spawning and lifecycle management
   - Anonymous function goroutines
   - Goroutine synchronization techniques

2. **Channel Communication Patterns**:
   - Unbuffered vs buffered channels
   - Channel direction restrictions
   - Channel closing and range patterns
   - Fan-in and fan-out patterns

3. **Select Statement Patterns**:
   - Non-blocking channel operations
   - Timeout and deadline patterns
   - Default case usage
   - Channel multiplexing

4. **Advanced Concurrency Patterns**:
   - Worker pool implementations
   - Pipeline architectures
   - Context-based cancellation
   - Graceful shutdown patterns

5. **Synchronization Primitives**:
   - Mutex and RWMutex usage
   - WaitGroup coordination
   - Atomic operations
   - sync.Once patterns

6. **Error Handling in Concurrent Code**:
   - Error propagation through channels
   - Context cancellation on errors
   - Graceful degradation patterns

Update session state with extracted patterns and examples.

STEP 4: Practical Implementation Guidance Generation

- Generate practical implementation examples for common scenarios
- Create decision trees for pattern selection
- Provide performance considerations and best practices
- Document common pitfalls and anti-patterns

**Implementation Decision Framework:**

```markdown
## Concurrency Pattern Selection Guide

### When to Use Goroutines:

- I/O-bound operations that can run concurrently
- Independent tasks that don't require shared state
- Background processing and cleanup tasks

### When to Use Channels:

- Communication between goroutines
- Coordinating goroutine execution
- Implementing producer-consumer patterns

### When to Use Select:

- Multiplexing multiple channel operations
- Implementing timeouts and cancellation
- Non-blocking channel operations

### When to Use Sync Primitives:

- Protecting shared memory access
- Coordinating goroutine completion
- Implementing atomic operations
```

STEP 5: Context Integration and Validation

TRY:

- Integrate all loaded documentation into comprehensive context
- Validate context completeness and accuracy
- Generate usage examples and practical applications
- Create quick reference guide for immediate use
- Save checkpoint: context_loading_complete

**Context Validation Checklist:**

- [ ] Basic goroutine patterns covered
- [ ] Channel communication patterns documented
- [ ] Select statement usage explained
- [ ] Worker pool implementations available
- [ ] Context package usage covered
- [ ] Synchronization primitives documented
- [ ] Error handling patterns included
- [ ] Performance considerations addressed

CATCH (incomplete_context):

- Document missing documentation areas
- Provide fallback guidance for uncovered patterns
- Recommend additional documentation sources
- Continue with available context

STEP 6: Session Completion and Context Summary

FINALLY:

- Generate comprehensive Go concurrency context summary
- Create quick reference guide for immediate consultation
- Archive session data for future reference
- Clean up temporary session files
- Update session state: phase = "completed"

```json
// Final session state update
{
  "sessionId": "$SESSION_ID",
  "phase": "completed",
  "loaded_sources": [
    "go-official-docs",
    "go-by-example",
    "effective-go",
    "go-blog-concurrency",
    "concurrency-patterns-talk",
    "sync-package-docs"
  ],
  "patterns_loaded": {
    "basic_goroutines": true,
    "channel_patterns": true,
    "select_statements": true,
    "worker_pools": true,
    "pipelines": true,
    "context_cancellation": true,
    "sync_primitives": true
  },
  "examples_count": 0,
  "context_depth": "comprehensive",
  "completion_timestamp": "$(date -Iseconds)"
}
```

## Expected Outcomes

After successful execution, you will have comprehensive context for:

### Core Concurrency Concepts

- **Goroutine Management**: Spawning, lifecycle, coordination patterns
- **Channel Communication**: Types, operations, directional channels
- **Select Statements**: Multiplexing, timeouts, non-blocking operations
- **Context Package**: Cancellation, deadlines, value propagation

### Advanced Patterns

- **Worker Pools**: Implementation strategies, scaling considerations
- **Pipeline Architectures**: Stage-based processing, fan-in/fan-out
- **Graceful Shutdown**: Cleanup patterns, resource management
- **Error Propagation**: Channel-based error handling, context cancellation

### Synchronization Techniques

- **Mutexes**: Read/write locks, critical sections
- **WaitGroups**: Goroutine coordination, completion waiting
- **Atomic Operations**: Lock-free programming, performance optimization
- **Once**: Single initialization patterns

### Performance Considerations

- **GOMAXPROCS**: Runtime tuning, CPU utilization
- **Channel Buffering**: Performance implications, backpressure
- **Memory Management**: Goroutine stack growth, garbage collection
- **Profiling**: Concurrent code analysis, bottleneck identification

### Common Pitfalls and Anti-patterns

- **Race Conditions**: Detection and prevention strategies
- **Deadlock Prevention**: Pattern recognition, avoidance techniques
- **Goroutine Leaks**: Resource cleanup, proper termination
- **Channel Misuse**: Common mistakes, best practices

## Integration with Development Workflow

- **Design Phase**: Pattern selection guidance for concurrent architectures
- **Implementation**: Code examples and templates for common patterns
- **Testing**: Concurrent code testing strategies and tools
- **Debugging**: Concurrency-specific debugging techniques
- **Performance**: Optimization strategies and profiling approaches

## Context Loading Verification

The loaded context should enable expert-level guidance on:

1. **Designing concurrent Go applications** with appropriate pattern selection
2. **Implementing robust channel communication** with proper error handling
3. **Building scalable worker pool architectures** with dynamic scaling
4. **Creating efficient pipeline systems** with backpressure management
5. **Handling cancellation and timeouts** using context package effectively
6. **Preventing race conditions and deadlocks** through proper synchronization
7. **Optimizing concurrent code performance** with profiling and tuning
8. **Testing concurrent applications** with race detection and stress testing

## Quick Reference Generation

````markdown
# Go Concurrency Quick Reference

## Basic Patterns

- `go func() { ... }()` - Anonymous goroutine
- `ch := make(chan Type, buffer)` - Channel creation
- `select { case <-ch: ... }` - Channel multiplexing

## Worker Pool Template

```go
func workerPool(jobs <-chan Job, results chan<- Result) {
    for job := range jobs {
        results <- processJob(job)
    }
}
```
````

## Context Cancellation

```go
ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
defer cancel()
```

## Synchronization

```go
var mu sync.Mutex
var wg sync.WaitGroup
```

```
Think deeply about Go concurrency patterns and their practical applications throughout the loading process to ensure comprehensive understanding and immediate applicability.
```
