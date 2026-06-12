# Odoo 18 Custom Modules Starter

Docker + Odoo 18 Community + a ready `addons/` layout for custom modules.

I built this while learning Odoo 18. Every new project meant setting up Docker again and figuring out where to put models, views, and security files. This repo is the structure I settled on - clone it and start customizing.

## Who is this for?

- Odoo devs starting custom modules
- Freelancers kicking off a new client project
- Small teams that want everyone using the same folder layout

## What's in the repo

- Docker setup (Odoo 18, PostgreSQL, Adminer)
- `base_custom` - shared security groups
- `example_custom` - working demo that adds a **Brief** field on CRM leads
- `_template_module` - copy this to create new modules (`./scripts/new-module.sh`)
- Docs in `docs/` - folder structure, adding fields, built-in vs custom

## Quick start

```bash
git clone https://github.com/tpjasar/odoo18-custom-modules-starter.git
cd odoo18-custom-modules-starter

cp .env.example .env
docker compose up -d
```

Open http://localhost:8070, create a database, install **CRM**, turn on Developer mode, then **Apps → Update Apps List → Install Example Custom**.

Check CRM → Leads for the new **Brief** field.

Full walkthrough: [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md)

### Port already in use?

Edit `.env` and change `POSTGRES_PORT`, `ODOO_PORT`, `ADMINER_PORT`. Defaults are `5434`, `8070`, `8085`. If you already run another Odoo stack, it may be on `5433` / `8069` / `8080`.

## Folder structure

```text
addons/
├── base_custom/          # shared security (optional foundation)
├── example_custom/       # install this to verify everything works
│   ├── models/crm/
│   ├── views/crm/
│   └── security/
└── _template_module/     # scaffold only - do not install
```

Put files by domain (`crm/`, `project/`, `sale/`) - not one flat `models/` folder with everything mixed together.

More detail: [docs/FOLDER_STRUCTURE.md](docs/FOLDER_STRUCTURE.md)

## Create a new module

```bash
./scripts/new-module.sh sales_custom
```

Edit `addons/sales_custom/`, update `__manifest__.py`, install from Apps.

## Upgrade after code changes

```bash
./scripts/upgrade-module.sh example_custom YOUR_DATABASE_NAME
```

Or in Odoo: Apps → your module → **Upgrade**

## Docs

| File | What it covers |
|------|----------------|
| [GETTING_STARTED.md](docs/GETTING_STARTED.md) | First run |
| [FOLDER_STRUCTURE.md](docs/FOLDER_STRUCTURE.md) | How to organize addons |
| [ADDING_A_FIELD.md](docs/ADDING_A_FIELD.md) | Add a custom field step by step |
| [BUILTIN_VS_CUSTOM.md](docs/BUILTIN_VS_CUSTOM.md) | When to code vs use standard Odoo |

## Requirements

- Odoo **18** Community (via Docker image)
- Docker and Docker Compose
- **CRM** app installed (for `example_custom`)

## Screenshot

After installing Example Custom, you should see a **Brief** field on the CRM lead form. Add your own screenshot here once you have one:

```markdown
![Brief field on CRM lead](docs/screenshot.png)
```

## Security

Default master password in `config/odoo.conf` is `changeme`. Change it before any real deployment.

## License

MIT for this repo. Odoo modules under `addons/` are LGPL-3.

## Author

**Muhammad Jasar T P**  
tpjasar88@gmail.com  
[GitHub](https://github.com/tpjasar) · [LinkedIn](https://linkedin.com/in/muhammad-jasar-t-p-484920128)
