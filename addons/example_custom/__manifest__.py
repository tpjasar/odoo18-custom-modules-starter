{
    'name': 'Example Custom',
    'version': '1.0.0',
    'category': 'Sales/CRM',
    'summary': 'Example module - custom field on CRM leads',
    'description': """
        Demonstrates the recommended folder structure for Odoo customizations.
        Adds a custom Brief field to leads. Copy _template_module to start your own module.
    """,
    'depends': [
        'base_custom',
        'crm',
    ],
    'data': [
        'security/ir.model.access.csv',
        'views/crm/crm_lead_views.xml',
    ],
    'installable': True,
    'application': False,
    'license': 'LGPL-3',
}
