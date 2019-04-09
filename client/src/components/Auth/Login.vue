<template lang="pug">
.row.justify-content-center.mt-md-5
	.col-md-8
		.card
			.card-header Login
			.card-body
				form(method='POST', @submit.prevent='login')
					.form-group.row
						label.col-sm-4.col-form-label.text-md-right(for='email') Email
						.col-md-6
							input(type='email', name='email', :class="errors.email ? 'form-control is-invalid' : 'form-control'", v-model='form.email', required='')
							span.invalid-feedback(v-if='errors.email', role='alert')
								strong {{ errors.email[0] }}
					.form-group.row
						label.col-md-4.col-form-label.text-md-right(for='password') Password
						.col-md-6
							input(type='password', name='password', :class="errors.password ? 'form-control is-invalid' : 'form-control'", v-model='form.password', required='')
							span.invalid-feedback(v-if='errors.password', role='alert')
								strong {{ errors.password[0]  }}
					.form-group.row.mb-0
						.col-md-8.offset-md-4
							button.btn.btn-primary(:disabled='isProcessing')
								| Login
</template>

<script>
export default {
	name: 'Login',
	data(){
		return{
			errors: {},
			form: {
				email: "",
				password: ""
			}
		}
	},
	methods: {
		async login () {
			try {
				const response = await AuthenticationService.login({
					email: this.email,
					password: this.password
				})
				this.$store.dispatch('setToken', response.data.token)
				this.$store.dispatch('setUser', response.data.user)
			} catch (error) {
				this.errors = error.response.data.error
			}
		}
	}

}
</script>

