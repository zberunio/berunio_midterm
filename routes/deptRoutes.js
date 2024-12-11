const express = require ('express');
const authenticateToken = require('../middleware/authMiddleware');
const {getAllDept, getDeptById, createDept, updateDept, deleteDept} = require('../controllers/deptController');


const router = express.Router();

router.get('/', authenticateToken, getAllDept);
router.get('/:id', authenticateToken, getDeptById);
router.post('/', authenticateToken, createDept);
router.put('/:id', authenticateToken, updateDept);
router.delete('/:id', authenticateToken, deleteDept);

module.exports = router;