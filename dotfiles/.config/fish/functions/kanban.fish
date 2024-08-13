function kanban
set -l root (git rev-parse --show-toplevel 2>/dev/null)
if [ $root ]
taskell "$root/KANBAN.md"
else
KANBAN.md
end
end
