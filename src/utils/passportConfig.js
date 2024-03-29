const LocalStrategy = require("passport-local").Strategy;
function initialize(passport, getUserByEmail, getUserById) {
    const authenticateUser =  async (email, password, done) => {
        console.log(email, password);
        const user = await getUserByEmail(email);
        if (user == null) {
            return done(null, false, { message: "No user with that email" });
        }
        try {
            if (password === user.password) {
                return done(null, user)
            } else {
                return done(null, false, { message: "Password Incorrect" })
            }
        } catch (error) {
            return done(error)
        }
    }
    passport.use(new LocalStrategy({ usernameField: 'email' }, authenticateUser))
    passport.serializeUser((user, done) => done(null, user.id))
    passport.deserializeUser(async (id, done) => {
        // console.log(id, "id")
        const user = await getUserById(id);
        return done(null, user)
    })
}

module.exports = initialize;