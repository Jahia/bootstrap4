package org.jahia.modules.bootstrap4.initializers;

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;

import javax.jcr.PropertyType;
import javax.jcr.RepositoryException;
import javax.jcr.Value;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Base class for the Bootstrap 4 module choice list initializers/renderers.
 * <p>
 * Holds the members shared by all concrete initializers: the {@code key} property
 * (with its accessors) and both {@code getStringRendering} implementations, plus a
 * helper to build {@link ChoiceListValue} entries.
 */
public abstract class AbstractChoiceListInitializerRenderer extends AbstractChoiceListRenderer
        implements ModuleChoiceListInitializer, ModuleChoiceListRenderer {

    protected static final String ADD_MIXIN = "addMixin";

    private String key;

    protected AbstractChoiceListInitializerRenderer(String key) {
        this.key = key;
    }

    /**
     * Builds a {@link ChoiceListValue} for the given value name, optionally attaching
     * an {@code addMixin} property pointing to the supplied mixin type.
     *
     * @param value the choice value name (used both as display name and stored value)
     * @param mixin the mixin to add when this value is selected, or {@code null} for none
     * @return the assembled choice list value
     */
    protected ChoiceListValue buildChoiceListValue(String value, String mixin) {
        Map<String, Object> properties = new HashMap<>();
        if (mixin != null) {
            properties.put(ADD_MIXIN, mixin);
        }
        return new ChoiceListValue(value, properties, new ValueImpl(value, PropertyType.STRING, false));
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getKey() {
        return key;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getStringRendering(RenderContext context, JCRPropertyWrapper propertyWrapper) throws RepositoryException {
        final StringBuilder sb = new StringBuilder();

        if (propertyWrapper.isMultiple()) {
            sb.append('{');
            final Value[] values = propertyWrapper.getValues();
            for (Value value : values) {
                sb.append('[').append(value.getString()).append(']');
            }
            sb.append('}');
        } else {
            sb.append('[').append(propertyWrapper.getValue().getString()).append(']');
        }

        return sb.toString();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getStringRendering(Locale locale, ExtendedPropertyDefinition propDef, Object propertyValue) throws RepositoryException {
        return "[" + propertyValue.toString() + "]";
    }
}
