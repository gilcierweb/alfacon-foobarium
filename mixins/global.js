export default {
    methods: {
        status_i18n(status) {
            if (status == 'active') {
                return 'Ativo'
            } else {
                return 'Inativo'
            }
        },
        gender_i18n(gender) {
            let text;
            switch (gender) {
                case 'male':
                    text = 'Masculino';
                    break;
                case 'female':
                    text = 'Feminino';
                    break;
                default:
                    text = 'Indefinido';
            }

            return text;
        },
        random_number(min, max) {
            return (Math.floor(Math.random() * (max - min)) + min);
        }
    }
}