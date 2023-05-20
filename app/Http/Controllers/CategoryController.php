<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Yajra\DataTables\Contracts\DataTable;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use App\Http\Requests\CategoryRequest;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (request()->ajax()) {
            $query = Category::query();

            return DataTables::of($query)
                ->addColumn('action', function ($item) {
                    return '

                        <a class="inline-block border border-gray-700 bg-gray-700 text-white rounded-md px-2 py-1 m-1 transition duration-500 ease select-none hover:bg-gray-800 focus:outline-none focus:shadow-outline"
                            href="' . route('dashboard.category.edit', $item->id) . '">
                            Edit
                        </a>
                        <form class="inline-block" action="' . route('dashboard.category.destroy', $item->id) . '" method="POST">
                        <button class="border border-red-500 bg-red-500 text-white rounded-md px-2 py-1 m-2 transition duration-500 ease select-none hover:bg-red-600 focus:outline-none focus:shadow-outline" >
                            Hapus
                        </button>
                            ' . method_field('delete') . csrf_field() . '
                        </form>
                        ';
                })
                ->editColumn('photo', function($item) {
                    return $item->photo ? '<img src="'. Storage::url($item->photo) .'"
                    style="max-height: 40px;" />' : '';
                })
                ->rawColumns(['action', 'photo'])
                ->make();
        }
        return view('pages.dashboard.category.index'); // Panggil tampilan dashboard produk
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.dashboard.category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoryRequest $request)
    {
        $data = $request->all();

        $data['slug']   = Str::slug($request->name); // convert name jadi slug
        $data['photo']  = $request->file('photo')->store('public/gallery');

        Category::create($data);

        return redirect()->route('dashboard.category.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Category::findOrFail($id);

        return view('pages.dashboard.category.edit', [
            'item' => $item
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryRequest $request, $id)
    {
        $data = $request->all();

        $data['slug']   = Str::slug($request->name); // convert name jadi slug
        $data['photo']  = $request->file('photo')->store('public/gallery');

        $item = Category::findOrFail($id);

        $item->update($data);

        return redirect()->route('dashboard.category.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Category::findOrFail($id);
        $item->delete();

        return redirect()->route('dashboard.category.index');
    }
}
