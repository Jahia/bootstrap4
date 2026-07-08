package org.jahia.modules.bootstrap4.initializers;

import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.junit.Before;
import org.junit.Test;

import javax.jcr.RepositoryException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class ButtonTypeInitializerTest {

    private ButtonTypeInitializer initializer;

    @Before
    public void setUp() {
        initializer = new ButtonTypeInitializer();
    }

    @Test
    public void getChoiceListValuesReturnsExpectedValuesInOrderWithMixins() throws RepositoryException {
        Map<String, Object> context = new HashMap<>();

        List<ChoiceListValue> result = initializer.getChoiceListValues(null, null, null, Locale.ENGLISH, context);

        assertEquals(5, result.size());
        assertChoice(result.get(0), "externalLink", "bootstrap4mix:externalLink");
        assertChoice(result.get(1), "internalLink", "bootstrap4mix:internalLink");
        assertChoice(result.get(2), "modal", "bootstrap4mix:modal");
        assertChoice(result.get(3), "collapse", "bootstrap4mix:collapse");
        assertChoice(result.get(4), "popover", "bootstrap4mix:popover");
    }

    @Test
    public void getChoiceListValuesReturnsEmptyListWhenContextIsNull() {
        List<ChoiceListValue> result = initializer.getChoiceListValues(null, null, null, Locale.ENGLISH, null);

        assertTrue(result.isEmpty());
    }

    @Test
    public void defaultKeyMatchesComponentName() {
        assertEquals("buttonTypeInitializer", initializer.getKey());
    }

    @Test
    public void setKeyOverridesDefaultKey() {
        initializer.setKey("customKey");

        assertEquals("customKey", initializer.getKey());
    }

    @Test
    public void getStringRenderingWrapsValueInBrackets() throws RepositoryException {
        ExtendedPropertyDefinition propDef = null;

        String rendered = initializer.getStringRendering(Locale.ENGLISH, propDef, "externalLink");

        assertEquals("[externalLink]", rendered);
    }

    private static void assertChoice(ChoiceListValue choice, String expectedValue, String expectedMixin) throws RepositoryException {
        assertEquals(expectedValue, choice.getDisplayName());
        assertEquals(expectedValue, choice.getValue().getString());
        assertEquals(expectedMixin, choice.getProperties().get("addMixin"));
    }
}
