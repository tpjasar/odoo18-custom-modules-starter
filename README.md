# Odoo 18 Custom Modules Starter

Starter kit for **Odoo 18 Community** customizations: Docker dev environment, opinionated folder structure, example module, and scaffold script. Stop copy-pasting addon folders on every project.

## What's included

- **Docker** - Odoo 18 + PostgreSQL + Adminer (`docker compose up -d`)
- **`base_custom`** - shared security groups foundation
- **`example_custom`** - working demo (custom **Brief** field on CRM leads)
- **`_template_module`** - copy via `./scripts/new-module.sh your_module`
- **Docs** - folder structure, adding fields, built-in vs custom

## Quick start

```bash
cp .env.example .env
docker compose up -d
```

Open http://localhost:8070 → create database → install **CRM** → enable Developer mode → **Apps** → Update Apps List → install **Example Custom**.

> **Port conflict?** If `docker compose up` fails with "port is already allocated", copy `.env.example` to `.env` and change `POSTGRES_PORT`, `ODOO_PORT`, `ADMINER_PORT` (defaults: 5434, 8070, 8085). Another Odoo stack on the same machine often uses 5433/8069/8080.

See [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md) for full steps.

## Folder structure

```text
addons/
├── base_custom/          # foundation (optional shared security)
├── example_custom/       # install this to verify setup
│   ├── models/crm/
│   ├── views/crm/
│   └── security/
└── _template_module/     # scaffold source - do not install
```

Organize modules by **domain** (`crm/`, `project/`, `sale/`) - not flat `models/` with everything mixed.

Details: [docs/FOLDER_STRUCTURE.md](docs/FOLDER_STRUCTURE.md)

## Create a new module

```bash
./scripts/new-module.sh sales_custom
```

Edit `addons/sales_custom/`, update `__manifest__.py`, then install from Apps.

## Upgrade after changes

```bash
./scripts/upgrade-module.sh example_custom YOUR_DATABASE_NAME
```

Or: Apps → your module → **Upgrade**

## Documentation

| Doc | Description |
|-----|-------------|
| [GETTING_STARTED.md](docs/GETTING_STARTED.md) | Install and first run |
| [FOLDER_STRUCTURE.md](docs/FOLDER_STRUCTURE.md) | How to organize addons |
| [ADDING_A_FIELD.md](docs/ADDING_A_FIELD.md) | Step-by-step field guide |
| [BUILTIN_VS_CUSTOM.md](docs/BUILTIN_VS_CUSTOM.md) | When to code vs use standard Odoo |

## Requirements

- Odoo **18** Community
- Docker & Docker Compose
- For `example_custom`: **CRM** app installed

## Security note

Change `admin_passwd` in `config/odoo.conf` before any production use. Default is `changeme`.

## License

MIT (starter repo). Odoo modules in `addons/` are LGPL-3 (Odoo convention).

## Author

**Muhammad Jasar T P**  
tpjasar88@gmail.com  
[GitHub](https://github.com/tpjasar) · [LinkedIn](https://linkedin.com/in/muhammad-jasar-t-p-484920128)
