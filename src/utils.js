'use strict'
const fs = require('fs')
const path = require('path')
const fx = require('mkdir-recursive')

var utils = module.exports = {}

/**
 * 遍历指定目录并返回该目录下所有的文件名列表
 *
 * @param {string} dir - 目录路经
 * @param {array} [filelist=[]] - 用于存储返回值的列表
 * @returns
 */
utils.walkPathSync = function (dir, filelist = []) {

    fs
        .readdirSync(dir)
        .forEach(function (file) {
            if (fs.statSync(path.join(dir, file)).isDirectory()) {
                filelist = utils.walkPathSync(path.join(dir, file), filelist)
            } else {
                filelist.push(path.join(dir, file))
            }
        })

    return filelist
}


utils.ensureFile = function (filepath) {
    if (!path.isAbsolute(filepath)) {
        filepath = path.resolve(filepath)
    }

    let index = filepath.lastIndexOf('/')
    let _path = filepath.slice(0, index)

    if (!fs.existsSync(_path)){
        fx.mkdirSync(_path)
    }
    if (!fs.existsSync(filepath)){
        fs.closeSync(fs.openSync(filepath, 'w'))
    }
}

utils.getABI = function (name) {
    const extension = '.abi'
    const filepath = path.join(__dirname, '../complied/', name + extension)

    return JSON.parse(fs.readFileSync(filepath, 'utf8'))
}


module.exports = utils