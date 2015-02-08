package fr.isima.webdev

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}

	def String toString() {
		authority
	}
}
