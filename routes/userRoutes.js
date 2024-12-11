const express = require ('express');
const authenticateToken = require('../middleware/authMiddleware');
const {getAllUsers, getUserById, createUser, updateUser, deleteUser} = require('../controllers/userController');


const router = express.Router();

router.get('/', authenticateToken, getAllUsers);
router.get('/:id', authenticateToken, getUserById);
router.post('/', authenticateToken, createUser);
router.put('/:id', authenticateToken, updateUser);
router.delete('/:id', authenticateToken, deleteUser);

module.exports = router;