import subprocess

from ulauncher.api.client.Extension import Extension
from ulauncher.api.client.EventListener import EventListener
from ulauncher.api.shared.event import KeywordQueryEvent, ItemEnterEvent
from ulauncher.api.shared.item.ExtensionResultItem import ExtensionResultItem
from ulauncher.api.shared.action.RenderResultListAction import RenderResultListAction
from ulauncher.api.shared.action.HideWindowAction import HideWindowAction
from ulauncher.api.shared.action.ExtensionCustomAction import ExtensionCustomAction

class CustomExtension(Extension):

    def __init__(self):
        super().__init__()
        self.subscribe(KeywordQueryEvent, KeywordQueryEventListener())
        self.subscribe(ItemEnterEvent, ItemEnterEventListener())


class KeywordQueryEventListener(EventListener):

    def on_event(self, event, extension):
        items = []
        for i in range(5):
            data = {'new_name': 'Item %s was clicked' % i}
            item = ExtensionResultItem(icon='images/icon.png',
                                       name='Item %s' % i,
                                       description='Item description %s' % i,
                                       on_enter=ExtensionCustomAction(data, keep_app_open=False))
            
            items.append(item)
            
            
        return RenderResultListAction(items)

class ItemEnterEventListener(EventListener):

    def on_event(self, event, extension):
        data = event.get_data()

        # do additional actions here...
        subprocess.run(["notify-send", "a", "b"]) 
        
        # you may want to return another list of results
        # return RenderResultListAction([ExtensionResultItem(icon='images/icon.png',
                                                           #name=data['new_name'],
                                                           #on_enter=HideWindowAction())])

if __name__ == '__main__':
    CustomExtension().run()

