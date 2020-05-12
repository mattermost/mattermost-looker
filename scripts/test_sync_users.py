import unittest
from sync_users import _get_email_categories

class SyncUserTestCase(unittest.TestCase):
    def test_get_email_categories(self):
        file_users = [
            {'email': 'email1@test.com'},
            {'email': 'email2@test.com'},
            {'email': 'email3@test.com'}
        ]
        looker_users = [
            {'email': 'email2@test.com'},
            {'email': 'email3@test.com'},
            {'email': 'email4@test.com'}
        ]
        (emails_in_both, emails_only_in_file, emails_only_in_looker) = _get_email_categories(file_users, looker_users)
        # Ignore order
        self.assertEqual(set(emails_in_both), set(['email2@test.com', 'email3@test.com']))
        self.assertEqual(emails_only_in_file, ['email1@test.com'])
        self.assertEqual(emails_only_in_looker, ['email4@test.com'])
