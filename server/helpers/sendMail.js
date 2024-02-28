const nodemailer = require('nodemailer')
const HTML_TEMPLATE = require('./mail_template')



const transporter = nodemailer.createTransport({
    service: "gmail",
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    auth: {
      user: "officialrrye5@gmail.com",
      pass: "qkka njfk qekc sldu",
    },
  });

const sendVerifyMail = async (email, message) => {
    const emailOption = {
        from: '"Fred Foo 👻" <foo@example.com>',
        to: `${email}`,
        subject: 'Verify Email!',
        html: HTML_TEMPLATE(message)
    }
    transporter.sendMail(emailOption, (err, data) => {
        if (err) {
            return console.log('Error occured: ', err)
        }
        return console.log('Email sent!!')
    })
}


const sendResetMail = (email, message) => {
    const emailOption = {
        from: '"Fred Foo 👻" <foo@example.com>',
        to: `${email}`,
        subject: 'Reset Account Password!',
        html: HTML_TEMPLATE(message)
    }
    transporter.sendMail(emailOption, (err, data) => {
        if (err) {
            return console.log('Error occured: ', err)
        }
        return console.log('Email sent!!')
    })
}

const sendChangeMail = (email, message) => {
    const emailOption = {
        from: '"Fred Foo 👻" <foo@example.com>',
        to: `${email}`,
        subject: 'Change Account Password!',
        html: HTML_TEMPLATE(message)
    }
    transporter.sendMail(emailOption, (err, data) => {
        if (err) {
            return console.log('Error occured: ', err)
        }
        return console.log('Email sent!!')
    })
}

module.exports = {
    sendVerifyMail, sendResetMail,sendChangeMail
}