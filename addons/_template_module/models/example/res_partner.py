from odoo import fields, models


class ResPartner(models.Model):
    _inherit = 'res.partner'

    template_reference = fields.Char(string='Reference')
