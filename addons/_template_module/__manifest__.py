{
    'name': 'Template Module',
    'version': '1.0.0',
    'category': 'Hidden',
    'summary': 'Template - do not install. Copy with scripts/new-module.sh',
    'depends': [
        'base_custom',
    ],
    'data': [
        'security/ir.model.access.csv',
        'views/example/example_views.xml',
    ],
    'installable': False,
    'application': False,
    'license': 'LGPL-3',
}
