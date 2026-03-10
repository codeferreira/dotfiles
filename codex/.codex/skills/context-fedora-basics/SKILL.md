---
name: "context-fedora-basics"
description: "Load essential Fedora Linux knowledge for daily system usage"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$context-fedora-basics`.
- Treat all user text after `$context-fedora-basics` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `context:fedora-basics`.
- Codex invocation: `$context-fedora-basics`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Session ID: `$(date +%s%N 2>/dev/null || echo "$(date +%s)000000000")`
- OS Check: `$(cat /etc/fedora-release 2>/dev/null || echo "Not Fedora")`

## Your task

IF the system is not Fedora:
PRINT "This command is designed for Fedora Linux systems."
EXIT

PRINT "📚 Loading Fedora Linux Essentials..."

**Essential Fedora Commands Reference:**

### Package Management (DNF)

```bash
# Update system
sudo dnf update

# Search for packages
dnf search [package_name]

# Install package
sudo dnf install [package_name]

# Remove package
sudo dnf remove [package_name]

# Show package info
dnf info [package_name]

# List installed packages
dnf list installed

# Clean cache
sudo dnf clean all
```

### Service Management (systemctl)

```bash
# Start/stop/restart service
sudo systemctl start|stop|restart [service_name]

# Enable/disable service at boot
sudo systemctl enable|disable [service_name]

# Check service status
systemctl status [service_name]

# List all services
systemctl list-units --type=service
```

### System Information

```bash
# System info
hostnamectl

# Disk usage
df -h

# Memory usage
free -h

# Running processes
top
```

### Log Viewing

```bash
# View system logs
journalctl

# Follow logs in real-time
journalctl -f

# View logs for specific service
journalctl -u [service_name]

# View boot messages
journalctl -b
```

### Network Commands

```bash
# Show network interfaces
ip addr

# Show network connections
ss -tulpn

# Test connectivity
ping [hostname]

# DNS lookup
nslookup [hostname]
```

### File Permissions & SELinux

```bash
# Change file permissions
chmod [permissions] [file]

# Change file ownership
chown [user]:[group] [file]

# Check SELinux status
getenforce

# View SELinux contexts
ls -Z

# Restore SELinux contexts
sudo restorecon -Rv [path]
```

### User Management

```bash
# Add user
sudo useradd [username]

# Set password
sudo passwd [username]

# Add user to group
sudo usermod -aG [group] [username]

# Switch user
su - [username]
```

### Firewall (firewalld)

```bash
# Check firewall status
sudo firewall-cmd --state

# List allowed services
sudo firewall-cmd --list-services

# Add service
sudo firewall-cmd --add-service=[service] --permanent
sudo firewall-cmd --reload

# Add port
sudo firewall-cmd --add-port=[port]/tcp --permanent
sudo firewall-cmd --reload
```

### Quick Tips:

- Use `Tab` for command completion
- Use `Ctrl+R` to search command history
- Use `man [command]` for detailed help
- Use `dnf provides [file]` to find which package provides a file
- Use `systemctl --failed` to see failed services

PRINT "✅ Fedora essentials loaded! Use these commands for daily system management."
PRINT "💡 For detailed help on any command, use: man [command_name]"
