const express = require('express');
const router = express.Router();

router.get(`/`, async (req, res) =>{     
    res.status(200).json({message: "The system is healthy"})
})

module.exports =router;