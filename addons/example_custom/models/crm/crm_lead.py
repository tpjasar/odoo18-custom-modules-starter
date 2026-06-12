from odoo import fields, models


class CrmLead(models.Model):
    _inherit = 'crm.lead'

    custom_brief = fields.Text(string='Brief')
