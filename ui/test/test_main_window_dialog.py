from qgis.testing import unittest, start_app
from qgis.testing.mocked import get_iface

from ..dialog import Dialog


start_app()


class TestUiMainWindow(unittest.TestCase):

    def test_show_query(self):
        """Test we can show a query by switching tab with all params."""
        # Empty query
        dialog = Dialog(get_iface())
        dialog.button_show_query.click()
        self.assertEqual(dialog.stacked_panels_widget.currentIndex(), dialog.query_index)
