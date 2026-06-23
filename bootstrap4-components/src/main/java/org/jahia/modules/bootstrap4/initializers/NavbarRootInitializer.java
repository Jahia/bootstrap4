package org.jahia.modules.bootstrap4.initializers;

import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.osgi.service.component.annotations.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Component(name = "navbarRootInitializer", service = ModuleChoiceListInitializer.class, immediate = true)
public class NavbarRootInitializer extends AbstractChoiceListInitializerRenderer {

    public NavbarRootInitializer() {
        super("navbarRootInitializer");
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

        myChoiceList.add(buildChoiceListValue("homePage", null));
        myChoiceList.add(buildChoiceListValue("currentPage", null));
        myChoiceList.add(buildChoiceListValue("parentPage", null));
        myChoiceList.add(buildChoiceListValue("customRootPage", "bootstrap4mix:customRootPage"));

        return myChoiceList;
    }
}
