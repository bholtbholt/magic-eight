module.exports = {
  plugins: [
    require('autoprefixer')(),
    require('postcss-nested')(),
    require('postcss-simple-vars')({
      variables: {
        $white: '#fff',
        $body: '#e66767',
        $bodyAccent: '#ea8685',

        $primaryActive: '#574b90',
        $primaryHighlight: '#3E3277',

        $radiusRound: '50%',
        $radiusCurved: '6px',

        $mobile: 'max-width: 699px',
        $desktop: 'min-width: 700px',
      },
    }),
  ],
};
