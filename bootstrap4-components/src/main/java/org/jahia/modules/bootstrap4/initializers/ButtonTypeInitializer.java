package org.jahia.modules.bootstrap4.initializers;

import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.osgi.service.component.annotations.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Component(name = "buttonTypeInitializer", service = ModuleChoiceListInitializer.class, immediate = true)
public class ButtonTypeInitializer extends AbstractChoiceListInitializerRenderer {

    public ButtonTypeInitializer() {
        super("buttonTypeInitializer");
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values,
                                                     Locale locale, Map<String, Object> context) {

        // Create the list of ChoiceListValue to return
        List<ChoiceListValue> myChoiceList = new ArrayList<>();

        if (context == null) {
            return myChoiceList;
        }

        myChoiceList.add(buildChoiceListValue("externalLink", "bootstrap4mix:externalLink"));
        myChoiceList.add(buildChoiceListValue("internalLink", "bootstrap4mix:internalLink"));
        myChoiceList.add(buildChoiceListValue("modal", "bootstrap4mix:modal"));
        myChoiceList.add(buildChoiceListValue("collapse", "bootstrap4mix:collapse"));
        myChoiceList.add(buildChoiceListValue("popover", "bootstrap4mix:popover"));

        return myChoiceList;
    }
}
