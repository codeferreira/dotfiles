---
name: "context-ops-context-load-fedora"
description: "Load Fedora Linux expertise with system information and configuration guidance"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$context-ops-context-load-fedora`.
- Treat all user text after `$context-ops-context-load-fedora` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `context:ops:context-load-fedora`.
- Codex invocation: `$context-ops-context-load-fedora`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Fedora System Detection


## Your task

IF FEDORA_DETECTED == "false":
PRINT "❌ This system is not running Fedora Linux. This command is designed specifically for Fedora systems."
PRINT "Detected OS: $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d= -f2 | tr -d '"' || echo 'Unknown')"
EXIT gracefully

ELSE:
PRINT "✅ Fedora Linux detected! Loading expertise and system information..."

**DEPLOY 8 PARALLEL AGENTS** for comprehensive Fedora expertise:

1. **System Architecture Agent**: Map Fedora's filesystem hierarchy, systemd units, and core system components
2. **Package Management Agent**: Deep dive into DNF, RPM, Flatpak, and repository management
3. **Configuration Agent**: Analyze system configuration files, networking, and service management
4. **Security Agent**: SELinux policies, firewall rules, and security best practices
5. **Performance Agent**: System tuning, monitoring tools, and optimization techniques
6. **Troubleshooting Agent**: Log analysis, debugging tools, and common issue resolution
7. **Development Agent**: Development tools, compilers, and Fedora-specific build processes
8. **Administration Agent**: User management, updates, and system maintenance procedures

**Phase 1: System Information Gathering**

COLLECT current system state:


**Phase 2: Create Fedora Expertise Knowledge Base**

CREATE /tmp/fedora-expertise-$SESSION_ID.json with:

```json
{
  "essential_directories": {
    "/etc/dnf/": "DNF package manager configuration",
    "/etc/yum.repos.d/": "Repository definitions",
    "/etc/systemd/": "Systemd service configurations",
    "/var/log/": "System and application logs",
    "/usr/share/doc/": "Package documentation",
    "/etc/selinux/": "SELinux configuration",
    "/etc/sysconfig/": "System configuration files"
  },
  "critical_commands": {
    "dnf": "Package management (install, update, search)",
    "rpm": "Low-level package operations",
    "systemctl": "Service management",
    "journalctl": "System log viewing",
    "firewall-cmd": "Firewall configuration",
    "ausearch/aureport": "SELinux audit logs",
    "getsebool/setsebool": "SELinux boolean management",
    "restorecon": "Fix SELinux contexts"
  },
  "configuration_files": {
    "/etc/dnf/dnf.conf": "DNF configuration",
    "/etc/selinux/config": "SELinux mode",
    "/etc/systemd/system.conf": "Systemd settings",
    "/etc/fstab": "Filesystem mounts",
    "/etc/hosts": "Static hostname mappings",
    "/etc/hostname": "System hostname",
    "/etc/nsswitch.conf": "Name service switch config"
  }
}
```

**Phase 3: Load Fedora-Specific Documentation**

FETCH documentation from official sources:

- Fedora Documentation: https://docs.fedoraproject.org/
- Fedora Magazine best practices
- RedHat Enterprise Linux shared knowledge
- Community troubleshooting guides

**Phase 4: Common spawn_agents Quick Reference**

GENERATE task-specific guidance:

**Package Management:**

```bash
# Update system
sudo dnf update

# Search packages
dnf search <package>

# Install package
sudo dnf install <package>

# Remove package
sudo dnf remove <package>

# Clean cache
sudo dnf clean all

# Show package info
dnf info <package>
```

**Service Management:**

```bash
# Start/stop/restart service
sudo systemctl start|stop|restart <service>

# Enable/disable at boot
sudo systemctl enable|disable <service>

# Check service status
systemctl status <service>

# View service logs
journalctl -u <service>
```

**SELinux Management:**

```bash
# Check SELinux status
getenforce

# Set SELinux mode
sudo setenforce 0|1

# View SELinux contexts
ls -Z

# Restore file contexts
sudo restorecon -Rv /path

# Check SELinux denials
sudo ausearch -m avc -ts recent
```

**Phase 5: Create Personalized Learning Plan**

Based on your current system, recommend:

1. Areas to explore based on installed packages
2. Security hardening steps specific to your configuration
3. Performance optimizations for your hardware
4. Useful tools not yet installed

**Phase 6: Interactive Q&A Mode**

OFFER to answer specific questions about:

- System administration tasks
- Troubleshooting specific issues
- Best practices for your use case
- Migration from other distributions

SAVE expertise session to: /tmp/fedora-expertise-$SESSION_ID.json
ARCHIVE to: ~/.fedora-expertise-history/

PRINT "🎓 Fedora expertise loaded! You now have access to:"
PRINT "- System-specific configuration knowledge"
PRINT "- Common commands and their usage"
PRINT "- Troubleshooting procedures"
PRINT "- Best practices for Fedora $FEDORA_VERSION"
PRINT ""
PRINT "Ask me anything about your Fedora system!"

FINALLY:
IF session completed:
ARCHIVE knowledge base for future reference
CLEAN temporary files
REPORT key insights discovered
