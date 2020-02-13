import unittest
from find_missing_fields import is_dimension_match_for_invalid_identifier

class MissingFieldsTestCase(unittest.TestCase):
    def test_simple_version_field(self):
        self.assertTrue(is_dimension_match_for_invalid_identifier({
            'name': 'account_owner.username',
            'sql': '${table}.username',
            'view': 'account_owner'
        }, 'ACCOUNT_OWNER.USERNAME'))

        self.assertTrue(is_dimension_match_for_invalid_identifier({
            'name': 'account_owner.product',
            'sql': '${table}.product__c',
            'view': 'account_owner'
        }, 'ACCOUNT_OWNER.product__c'))

        self.assertTrue(is_dimension_match_for_invalid_identifier({
            'name': 'product2.product_url',
            'sql': '${table}.producturl',
            'view': 'product2'
        }, 'product2.producturl'))
