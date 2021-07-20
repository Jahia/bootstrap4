window.jahia.i18n.loadNamespaces('bootstrap4-components');

window.jahia.uiExtender.registry.add('callback', 'bootstrap4-components', {
    targets: ['jahiaApp-init:60'],
    callback: function () {
        window.jahia.uiExtender.registry.add('pickerConfiguration', 'pagesandfiles', {
            cmp: {
                picker: window.jahia.uiExtender.registry.get('selectorType', 'ContentPicker'),
                treeConfigs: [{
                    rootPath: site => `/sites/${site}`,
                    openableTypes: ['jnt:page', 'jnt:navMenuText', 'jnt:virtualsite', 'jnt:contentFolder', 'nt:folder', 'jmix:siteContent', 'jmix:browsableInEditorialPicker'],
                    selectableTypes: ['jnt:page', 'jnt:navMenuText', 'jnt:virtualsite', 'jnt:contentFolder', 'nt:folder', 'jmix:siteContent', 'jmix:browsableInEditorialPicker'],
                    type: 'pagesandfiles',
                }],
                searchSelectorType: 'bootstrap4mix:internalLink',
                listTypesTable: ['jmix:droppableContent', 'jnt:page', 'jnt:file'],
                selectableTypesTable: ['jmix:droppableContent', 'jnt:page', 'jnt:file']
            }
        });        
    }
});
