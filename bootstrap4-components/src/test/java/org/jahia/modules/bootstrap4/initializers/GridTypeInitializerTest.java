package org.jahia.modules.bootstrap4.initializers;

import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.junit.Before;
import org.junit.Test;

import javax.jcr.RepositoryException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class GridTypeInitializerTest {

    private GridTypeInitializer initializer;

    @Before
    public void setUp() {
        initializer = new GridTypeInitializer();
    }

    @Test
    public void getChoiceListValuesReturnsExpectedValuesInOrder() throws RepositoryException {
        Map<String, Object> context = new HashMap<>();

        List<ChoiceListValue> result = initializer.getChoiceListValues(null, null, null, Locale.ENGLISH, context);

        assertEquals(3, result.size());
        assertChoice(result.get(0), "nogrid", null);
        assertChoice(result.get(1), "predefinedGrid", "bootstrap4mix:predefinedGrid");
        assertChoice(result.get(2), "customGrid", "bootstrap4mix:customGrid");
    }

    @Test
    public void getChoiceListValuesReturnsEmptyListWhenContextIsNull() {
        List<ChoiceListValue> result = initializer.getChoiceListValues(null, null, null, Locale.ENGLISH, null);

        assertTrue(result.isEmpty());
    }

    @Test
    public void defaultKeyMatchesComponentName() {
        assertEquals("gridTypeInitializer", initializer.getKey());
    }

    @Test
    public void getStringRenderingWrapsValueInBrackets() throws RepositoryException {
        String rendered = initializer.getStringRendering(Locale.ENGLISH, null, "nogrid");

        assertEquals("[nogrid]", rendered);
    }

    private static void assertChoice(ChoiceListValue choice, String expectedValue, String expectedMixin) throws RepositoryException {
        assertEquals(expectedValue, choice.getDisplayName());
        assertEquals(expectedValue, choice.getValue().getString());
        if (expectedMixin == null) {
            assertNull(choice.getProperties().get("addMixin"));
        } else {
            assertEquals(expectedMixin, choice.getProperties().get("addMixin"));
        }
    }
}
