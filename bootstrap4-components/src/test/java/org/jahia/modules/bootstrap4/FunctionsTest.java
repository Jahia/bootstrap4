package org.jahia.modules.bootstrap4;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class FunctionsTest {

    @Test
    public void replaceAllReplacesEveryMatch() {
        assertEquals("a-b-c", Functions.replaceAll("a b c", " ", "-"));
    }

    @Test
    public void replaceAllSupportsRegexPatterns() {
        assertEquals("abc", Functions.replaceAll("a1b2c3", "[0-9]", ""));
    }

    @Test
    public void replaceAllReturnsSameStringWhenNoMatch() {
        assertEquals("hello", Functions.replaceAll("hello", "z", "Z"));
    }
}
