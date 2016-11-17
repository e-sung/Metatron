//
//  APETagGenresTest.swift
//  Metatron
//
//  Created by Almaz Ibragimov on 15.09.16.
//  Copyright © 2016 Almazrafi. All rights reserved.
//

import XCTest

@testable import Metatron

class APETagGenresTest: XCTestCase {

    // MARK: Instance Methods

    func test() {
        let tag = APETag()

        do {
            let value: [String] = []

            tag.genres = value

            XCTAssert(tag.genres == value)

            XCTAssert(tag["Genre"] == nil)

            do {
                tag.version = APEVersion.v1

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = APEVersion.v2

                XCTAssert(tag.toData() == nil)
            }

            guard let item = tag.appendItem("Genre") else {
                return XCTFail()
            }

            item.stringListValue = value

            XCTAssert(tag.genres == value)
        }

        do {
            let value = [""]

            tag.genres = value

            XCTAssert(tag.genres == [])

            XCTAssert(tag["Genre"] == nil)

            do {
                tag.version = APEVersion.v1

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = APEVersion.v2

                XCTAssert(tag.toData() == nil)
            }

            guard let item = tag.appendItem("Genre") else {
                return XCTFail()
            }

            item.stringListValue = value

            XCTAssert(tag.genres == [])
        }

        do {
            let value = ["Abc 123"]

            tag.genres = value

            XCTAssert(tag.genres == value)

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            item.stringListValue = value

            XCTAssert(tag.genres == value)
        }

        do {
            let value = ["Абв 123"]

            tag.genres = value

            XCTAssert(tag.genres == value)

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            item.stringListValue = value

            XCTAssert(tag.genres == value)
        }

        do {
            let value = ["Abc 1", "Abc 2"]

            tag.genres = value

            XCTAssert(tag.genres == value)

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            item.stringListValue = value

            XCTAssert(tag.genres == value)
        }

        do {
            let value = ["", "Abc 2"]

            tag.genres = value

            XCTAssert(tag.genres == ["Abc 2"])

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == ["Abc 2"])

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == ["Abc 2"])
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == ["Abc 2"])
            }

            item.stringListValue = value

            XCTAssert(tag.genres == ["Abc 2"])
        }

        do {
            let value = ["Abc 1", ""]

            tag.genres = value

            XCTAssert(tag.genres == ["Abc 1"])

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == ["Abc 1"])

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == ["Abc 1"])
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == ["Abc 1"])
            }

            item.stringListValue = value

            XCTAssert(tag.genres == ["Abc 1"])
        }

        do {
            let value = ["", ""]

            tag.genres = value

            XCTAssert(tag.genres == [])

            XCTAssert(tag["Genre"] == nil)

            do {
                tag.version = APEVersion.v1

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = APEVersion.v2

                XCTAssert(tag.toData() == nil)
            }

            guard let item = tag.appendItem("Genre") else {
                return XCTFail()
            }

            item.stringListValue = value

            XCTAssert(tag.genres == [])
        }

        do {
            let value = [Array<String>(repeating: "Abc", count: 123).joined(separator: "\n")]

            tag.genres = value

            XCTAssert(tag.genres == value)

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            item.stringListValue = value

            XCTAssert(tag.genres == value)
        }

        do {
            let value = Array<String>(repeating: "Abc", count: 123)

            tag.genres = value

            XCTAssert(tag.genres == value)

            guard let item = tag["Genre"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.genres == value)
            }

            item.stringListValue = value

            XCTAssert(tag.genres == value)
        }

        guard let item = tag.appendItem("Genre") else {
            return XCTFail()
        }

        do {
            item.value = [UInt8](String("Abc 1\0Abc 2").utf8)

            XCTAssert(tag.genres == ["Abc 1", "Abc 2"])
        }

        do {
            item.value = [UInt8](String("\0Abc 2").utf8)

            XCTAssert(tag.genres == ["Abc 2"])
        }

        do {
            item.value = [UInt8](String("Abc 1\0").utf8)

            XCTAssert(tag.genres == ["Abc 1"])
        }

        do {
            item.value = [0]

            XCTAssert(tag.genres == [])
        }
    }
}