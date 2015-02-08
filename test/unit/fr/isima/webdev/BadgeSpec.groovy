package fr.isima.webdev

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Badge)

class BadgeSpec extends Specification {


    def setup() {
    }

    def cleanup() {
    }

    void "test  badges"() {
        expect:
        assertEquals(15,Badge.DefinedBadge.values().size())
    }

}
