//
//  Extensions.swift
//  Metatron
//
//  Copyright (c) 2016 Almaz Ibragimov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension String {

    // MARK: Instance Properties

    func prefix(_ maxLength: Int) -> String {
        if self.distance(from: self.startIndex, to: self.endIndex) > maxLength {
            return self.substring(to: self.index(self.startIndex, offsetBy: maxLength))
        }

        return self
    }
}

extension Sequence where Iterator.Element == String {

    // MARK: Instance Properties

    var revised: [String] {
        var revised: [String] = []

        for string in self {
            if !string.isEmpty {
                revised.append(string)
            }
        }

        return revised
    }
}

extension Array where Element: Equatable {
    func lastIndex(of element: Element) -> Array.Index? {
        for i in stride(from: self.count - 1, through: 0, by: -1) {
            if self[i] == element {
                return i
            }
        }

        return nil
    }

    func firstOccurrence(of target: Array<Element>) -> Array.Index? {
        guard (self.count >= target.count) && (target.count != 0) else {
            return nil
        }

        if target.count == 1 {
            return self.index(of: target[0])
        }

        let range = self.count - target.count
        var start = 0

        if target[0] == target[1] {
            repeat {
                if self[start + 1] == target[1] {
                    if self[start] == target[0] {
                        var status = true

                        for i in 2..<target.count {
                            if self[start + i] != target[i] {
                                status = false

                                break
                            }
                        }

                        if status {
                            return start
                        }
                    }

                    start += 1
                } else {
                    start += 2
                }
            }
            while start <= range
        } else {
            repeat {
                if self[start + 1] == target[1] {
                    if self[start] == target[0] {
                        var status = true

                        for i in 2..<target.count {
                            if self[start + i] != target[i] {
                                status = false

                                break
                            }
                        }

                        if status {
                            return start
                        }
                    }

                    start += 2
                } else {
                    start += 1
                }
            }
            while start <= range
        }

        return nil
    }

    func lastOccurrence(of target: Array<Element>) -> Array.Index? {
        guard (self.count >= target.count) && (target.count != 0) else {
            return nil
        }

        if target.count == 1 {
            return self.lastIndex(of: target[0])
        }

        var start = self.count - target.count

        if target[0] == target[1] {
            repeat {
                if self[start] == target[0] {
                    var status = true

                    for i in 1..<target.count {
                        if self[start + i] != target[i] {
                            status = false

                            break
                        }
                    }

                    if status {
                        return start
                    }

                    start -= 1
                } else {
                    start -= 2
                }
            }
            while start >= 0
        } else {
            repeat {
                if self[start] == target[0] {
                    var status = true

                    for i in 1..<target.count {
                        if self[start + i] != target[i] {
                            status = false

                            break
                        }
                    }

                    if status {
                        return start
                    }

                    start -= 2
                } else {
                    start -= 1
                }
            }
            while start >= 0
        }

        return nil
    }
}
