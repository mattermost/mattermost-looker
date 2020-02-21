import unittest
from search import get_search_results

class SearchTestCase(unittest.TestCase):
    def test_get_search_results(self):
        input_str = 'Jake'
        str_to_search = 'Jake was a good kid.  He really liked flowers.  jake is calm.  His mom called him Jake.'

        self.assertEqual(
            get_search_results(input_str, str_to_search, context_length=5),
            [
                'Jake was',
                'rs.  jake is c',
                'him Jake.',
            ]
        )

    def test_get_search_results_no_strip(self):
        input_str = 'Jake'
        str_to_search = 'Jake was a good kid.  He really liked flowers.  jake is calm.  His mom called him Jake.'

        self.assertEqual(
            get_search_results(input_str, str_to_search, context_length=5, strip=False),
            [
                'Jake was ',
                'rs.  jake is c',
                ' him Jake.',
            ]
        )
