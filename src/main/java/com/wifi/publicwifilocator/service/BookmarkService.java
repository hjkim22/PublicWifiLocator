package com.wifi.publicwifilocator.service;

import com.wifi.publicwifilocator.dto.BookmarkDto;
import com.wifi.publicwifilocator.dto.BookmarkGroupDto;
import com.wifi.publicwifilocator.entity.BookmarkGroup;
import com.wifi.publicwifilocator.repository.BookmarkRepository;

import java.util.ArrayList;

public class BookmarkService {
    BookmarkRepository bookmarkRepository = new BookmarkRepository();

    public boolean addBookmarkGroup(String name, int sequence) {
        return bookmarkRepository.createBookmarkGroup(name, sequence);
    }

    public ArrayList<BookmarkGroup> getBookmarkGroups() {
        return bookmarkRepository.getBookmarkGroupList();
    }

    public boolean addBookmark(int id, String mgrNo) {
        return bookmarkRepository.createBookmark(id, mgrNo);
    }

    public ArrayList<BookmarkDto> getBookmarks() {
        return bookmarkRepository.getBookmarkList();
    }

    public BookmarkDto getBookmarkInformation(int id) {
        return bookmarkRepository.getBookmarkInfo(id);
    }

    public BookmarkGroupDto getBookmarkGroupInformation(int id) {
        return bookmarkRepository.getBookmarkGroupInfo(id);
    }

    public boolean editBookmarkGroup(String bookmarkGroupName, int bookmarkGroupSeq, int id) {
        return bookmarkRepository.updateBookmarkGroup(bookmarkGroupName, bookmarkGroupSeq, id);
    }

    public boolean removeBookmarkGroup(int id) {
        return bookmarkRepository.deleteBookmarkGroup(id);
    }

    public boolean removeBookmark(int id) {
        return bookmarkRepository.deleteBookmark(id);
    }
}