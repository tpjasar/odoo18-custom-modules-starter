# Getting Started

## Requirements

- Docker and Docker Compose
- Odoo **18** Community (provided via Docker image)

## Quick start

```bash
git clone https://github.com/tpjasar/odoo18-custom-modules-starter.git
cd odoo18-custom-modules-starter

cp .env.example .env
docker compose up -d
```

Open **http://localhost:8070** (or your `ODOO_PORT` from `.env`).

If Docker fails with **port is already allocated**, edit `.env` and pick free ports (e.g. `5434`, `8070`, `8085`).

1. Create a database (first visit wizard)
2. Install **CRM** app (needed for the example module)
3. Enable **Developer mode**: Settings → Developer Tools → Activate
4. **Apps** → Update Apps List
5. Search **Example Custom** → Install
6. Open **CRM → Leads** - you should see the **Brief** field

## Create your own module

```bash
./scripts/new-module.sh sales_custom
```

Edit `addons/sales_custom/`, then install it from the Apps menu.

## After code changes

**Option A - UI:** Apps → your module → Upgrade

**Option B - terminal:**

```bash
./scripts/upgrade-module.sh example_custom YOUR_DATABASE_NAME
```

## Optional: Adminer (database UI)

Open **http://localhost:8085** (or your `ADMINER_PORT`) - connect with credentials from `.env`.
