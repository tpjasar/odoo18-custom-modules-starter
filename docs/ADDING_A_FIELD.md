# Adding a Custom Field

Example: add `deal_value` to `project.project`.

## 1. Model — `models/project/project_project.py`

```python
from odoo import fields, models


class ProjectProject(models.Model):
    _inherit = 'project.project'

    deal_value = fields.Monetary(string='Deal Value', currency_field='currency_id')
```

## 2. Register — `models/project/__init__.py`

```python
from . import project_project
```

## 3. Register domain — `models/__init__.py`

```python
from . import project
```

## 4. View — `views/project/project_views.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<odoo>
    <record id="project_project_view_form_inherit" model="ir.ui.view">
        <field name="name">project.project.form.inherit.my.module</field>
        <field name="model">project.project</field>
        <field name="inherit_id" ref="project.edit_project"/>
        <field name="arch" type="xml">
            <field name="partner_id" position="after">
                <field name="deal_value"/>
            </field>
        </field>
    </record>
</odoo>
```

## 5. Manifest — `__manifest__.py`

Add dependencies and data files:

```python
'depends': ['base_custom', 'project'],
'data': [
    'security/ir.model.access.csv',
    'views/project/project_views.xml',
],
```

## 6. Upgrade

```bash
./scripts/upgrade-module.sh your_module YOUR_DATABASE_NAME
```

Or: Apps → your module → Upgrade

## Checklist

- [ ] Field in correct `models/<domain>/` file
- [ ] View in matching `views/<domain>/` file
- [ ] `depends` includes the standard Odoo app (e.g. `crm`, `project`)
- [ ] Security updated if you added a new model (not needed for `_inherit` only)
- [ ] Module upgraded in Odoo
