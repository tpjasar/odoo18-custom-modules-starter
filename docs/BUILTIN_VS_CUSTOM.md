# Built-in vs Custom

Before writing code, ask: **does standard Odoo already do this?**

## Three types of work

| Type | Meaning | Action |
|------|---------|--------|
| **Built-in** | Standard Odoo feature | Configure in Settings / Apps — no custom code |
| **Config** | Studio, views, automation rules | Use Odoo UI where possible |
| **Custom** | Not available in standard Odoo | Code in `addons/your_module/` |

## Examples

| Need | Built-in? | Custom code? |
|------|-----------|--------------|
| CRM pipeline stages | Yes | No — configure stages |
| Quotation from opportunity | Yes | No — standard Sales flow |
| Project from sales order | Yes | Yes — service product "Create on Order: Project" |
| Extra field on lead (Brief) | No | Yes — `models/crm/crm_lead.py` |
| Developer sees only assigned projects | Partial | Often yes — record rules in `security/` |
| Down payment invoice (20%) | Yes | No — SO → Create Invoice |

## Rule

**Use built-in Odoo first.** Add custom modules only when standard Odoo is not enough.

## Standard flow (don't rebuild)

```text
Lead (CRM)
  → Opportunity
  → Quotation (Sales)
  → Confirm Sales Order
  → Project (auto-created from service product)
  → Tasks + Timesheets
  → Invoices
```

Customize **fields and rules** on top of this flow — don't replace the apps.
