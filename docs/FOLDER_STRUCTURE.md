# Folder Structure

```text
odoo18-custom-modules-starter/
├── docker-compose.yml       # Odoo 18 + PostgreSQL + Adminer
├── config/odoo.conf         # addons_path → ./addons
├── addons/
│   ├── base_custom/         # Shared security groups (foundation)
│   ├── example_custom/      # Working example - install this first
│   └── _template_module/    # Copy via scripts/new-module.sh (do not install)
├── scripts/
│   ├── new-module.sh
│   └── upgrade-module.sh
└── docs/
```

## Per-module layout (recommended)

Organize by **Odoo app / domain**, not by file type at the top level:

```text
your_module/
├── __init__.py
├── __manifest__.py
├── models/
│   ├── __init__.py
│   ├── crm/                 # crm.lead extensions
│   ├── project/             # project.project extensions
│   └── sale/                # sale.order extensions
├── views/
│   ├── crm/
│   ├── project/
│   └── sale/
└── security/
    ├── ir.model.access.csv
    ├── security_groups.xml
    └── record_rules.xml     # when needed
```

## Module roles

| Module | Purpose | Install? |
|--------|---------|----------|
| `base_custom` | Shared groups used by multiple modules | Optional (example depends on it) |
| `example_custom` | Demo: custom field on CRM lead | Yes - to verify setup |
| `_template_module` | Scaffold source only | **Never** - use `new-module.sh` |

## When to split modules

- **One module** is fine until it grows large (many apps: CRM + Project + HR)
- Split when: different teams own different areas, or install order matters
- Example split: `sales_custom`, `project_custom`, `hr_custom`
