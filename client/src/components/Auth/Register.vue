<template lang="pug">
	.row.justify-content-center.mt-md-5
		.col-md-8
			.card
				.card-header Register
				.card-body
					form.form(@submit.prevent='register')
						.form-group.row
							label.col-md-4.col-form-label.text-md-right(for='name') Name
							.col-md-6
								input#name(type='text', :class="errors.name ? 'form-control is-invalid' : 'form-control'", name='name', v-model='form.name', required='', autofocus='')
								span.invalid-feedback(v-if='errors.name', role='alert')
									strong {{ errors.name[0] }}
						.form-group.row
							label.col-md-4.col-form-label.text-md-right(for='email') Email Adress
							.col-md-6
								input#email(type='email', :class="errors.email ? 'form-control is-invalid' : 'form-control'", name='email', v-model='form.email', required='')
								span.invalid-feedback(v-if='errors.email', role='alert')
									strong {{ errors.email[0] }}
						.form-group.row
							label.col-md-4.col-form-label.text-md-right(for='password') Password
							.col-md-6
								input#password(type='password', :class="errors.password ? 'form-control is-invalid' : 'form-control'", name='password', v-model='form.password', required='')
								span.invalid-feedback(v-if='errors.password', role='alert')
									strong {{ errors.password[0]  }}
						.form-group.row.mb-0
							.col-md-6.offset-md-4
								button.btn.btn-primary(:disabled='isProcessing') Register
</template>

<script>
import AuthenticationService from "@/services/AuthenticationService";
export default {
	name: "Register",
	data() {
		return {
			errors: {},
			isProcessing: false,
			form: {
				name: "",
				email: "",
				password: ""
			}
		};
	},
	methods: {
		async register() {
			try {
				const response = await AuthenticationService.register({
					email: this.email,
					password: this.password
				});
				this.$store.dispatch("setToken", response.data.token);
				this.$store.dispatch("setUser", response.data.user);
			} catch (error) {
				this.error = error.response.data.error;
			}
		}
	}
};
</script>

