<template lang="pug">
	nav.navbar.navbar-expand-lg.navbar-light.bg-light
		a.navbar-brand(href="#") Nearby Shops
		button.navbar-toggler(type='button', data-toggle='collapse', data-target='#navbarNav', aria-controls='navbarNav', aria-expanded='false', aria-label='Toggle navigation')
			span.navbar-toggler-icon
		#navbarNav.collapse.navbar-collapse
			ul.navbar-nav.ml-auto
				li.nav-item
					router-link.nav-link(to='/') NEARBY SHOPS
				li.nav-item(v-show='auth')
					router-link.nav-link(to='/Preferred') MY PREFERRED SHOPS
				li.nav-item(v-show='guest')
					router-link.nav-link(to='/login') LOGIN
				li.nav-item(v-show='guest')
					router-link.nav-link(to='/register') REGISTER
				li.nav-item(v-show='auth')
					a.nav-link(@click.stop='logout', style='cursor: pointer;') LOGOUT

</template>

<script>
	export default {
		name: 'Navbar',
		props: {
			user: String
		}
	}
</script>