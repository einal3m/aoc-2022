require_relative 'Day07'
require_relative '../spec/spec_helper'

RSpec.describe Day07 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          '$ cd /',
          '$ ls',
          'dir a',
          '14848514 b.txt',
          '8504156 c.dat',
          'dir d',
          '$ cd a',
          '$ ls',
          'dir e',
          '29116 f',
          '2557 g',
          '62596 h.lst',
          '$ cd e',
          '$ ls',
          '584 i',
          '$ cd ..',
          '$ cd ..',
          '$ cd d',
          '$ ls',
          '4060174 j',
          '8033020 d.log',
          '5626152 d.ext',
          '7214296 k'
        ]
      end

      it 'matches example result' do
        expect(Day07.part1(input)).to eq(95437)
      end
    end

    # not 10817889 too high
    # not 1549713 too low
    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 07 Part One:'
        puts Day07.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          '$ cd /',
          '$ ls',
          'dir a',
          '14848514 b.txt',
          '8504156 c.dat',
          'dir d',
          '$ cd a',
          '$ ls',
          'dir e',
          '29116 f',
          '2557 g',
          '62596 h.lst',
          '$ cd e',
          '$ ls',
          '584 i',
          '$ cd ..',
          '$ cd ..',
          '$ cd d',
          '$ ls',
          '4060174 j',
          '8033020 d.log',
          '5626152 d.ext',
          '7214296 k'
        ]
      end

      it 'matches example result' do
        expect(Day07.part2(input)).to eq(24933642)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 07 Part Two:'
        puts Day07.part2(input)
        puts '--------------------------'
      end
    end
  end
end


# {
#   "/"=>428307,
#   "//dfmhjhd"=>314974,
#   "//hztjntff"=>857919,
#   "//hztjntff/cwsf"=>751010,
#   "//hztjntff/cwsf/msr"=>272198,
#   "//hztjntff/sthqhrc"=>45847,
#   "//rvstq"=>597067,
#   "//rvstq/nzdgz"=>117527,
#   "//rvstq/nzdgz/fplqm"=>325552,
#   "//rvstq/nzdgz/fplqm/cwsf/fld/jdpz"=>299969,
#   "//rvstq/nzdgz/fplqm/cwsf/fld/trjltfq"=>30081,
#   "//rvstq/nzdgz/fplqm/cwzstq"=>305925, "//rvstq/nzdgz/hzpqfj"=>749058, "//rvstq/nzdgz/hzpqfj/sztz/mjmbld"=>101870, "//rvstq/nzdgz/hzpqfj/sztz/nzdgz"=>86208, "//rvstq/nzdgz/hzpqfj/sztz/wrmm"=>242305, "//rvstq/nzdgz/hztjntff"=>633462, "//rvstq/nzdgz/hztjntff/hztjntff/hztjntff"=>210571, "//rvstq/nzdgz/hztjntff/hztjntff/tfdnvnn"=>108268, "//rvstq/nzdgz/jcszc"=>341563, "//rvstq/nzdgz/nzwzq"=>6875, "//rvstq/nzdgz/prbptvql"=>177069, "//rvstq/nzdgz/tnpshhml"=>227272, "//rvstq/nzdgz/tsjsfg"=>470189, "//rvstq/nzdgz/tsjsfg/fjhjl"=>54983, "//rvstq/vtlj"=>594215, "//rvstq/vtlj/hztjntff"=>58108, "//rvstq/vtlj/tzwfnn/grznq"=>282278, "//rvstq/vtlj/wrmm"=>112688, "//rvstq/wmjbt"=>31392, "//rvstq/wmjbt/bpqjsnr"=>132830, "//rvstq/wmjbt/bpqjsnr/bqg"=>893174, "//rvstq/wmjbt/bpqjsnr/bqg/hztjntff/bqg"=>188558, "//rvstq/wmjbt/bpqjsnr/bqg/hztjntff/hljm/clblt"=>228450, "//rvstq/wmjbt/bpqjsnr/bqg/hztjntff/hljm/clblt/qdjj"=>152548, "//rvstq/wmjbt/bpqjsnr/bqg/jvzn"=>265757, "//rvstq/wmjbt/bqg"=>785817, "//rvstq/wmjbt/cwsf"=>242327, "//rvstq/wmjbt/vlhr"=>156011, "//rvstq/wmjbt/wrmm/cwsf"=>467738, "//rvstq/wmjbt/wrmm/cwsf/bstnjc"=>11588, "//rvstq/wmjbt/wrmm/ljpn"=>375882, "//rvstq/wmjbt/wrmm/ljpn/cgghhhlf"=>14765, "//rvstq/wmjbt/wrmm/ljpn/qfwrrp"=>256670, "//rvstq/wmjbt/wrmm/ljpn/smpltb/bgvfj"=>65336, "//rvstq/wmjbt/wrmm/vzwtzl"=>53337, "//rvstq/wmjbt/wrmm/wjsf"=>648792, "//rvstq/wmjbt/zgljrz"=>134867, "//rvstq/wmjbt/zgt"=>350435, "//rvstq/wrmm"=>540561, "//rvstq/wrmm/clt"=>62449, "//rvstq/wrmm/mjpw"=>147523, "//rvstq/wrmm/nlwpspl"=>764145, "//rvstq/wrmm/nlwpspl/bmmmhnbc"=>808564, "//rvstq/wrmm/nlwpspl/bmmmhnbc/bldfbzr"=>648169, "//rvstq/wrmm/nlwpspl/bmmmhnbc/bldfbzr/bqg"=>187091, "//rvstq/wrmm/nlwpspl/bmmmhnbc/bldfbzr/nzdgz/nhmts"=>105545, "//rvstq/wrmm/nlwpspl/bmmmhnbc/bldfbzr/nzdgz/tqhthh"=>96001, "//rvstq/wrmm/nlwpspl/bmmmhnbc/bldfbzr/qjzh"=>162159, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf"=>416613, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf/bqg"=>269163, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf/frc/wrmm/ctrbwhpr"=>94535, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf/frc/wrmm/shmjt"=>6523, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf/jbgrgz"=>213046, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf/jbgrgz/frvlnww"=>423143, "//rvstq/wrmm/nlwpspl/bmmmhnbc/cwsf/jbgrgz/qszdtg"=>497389, "//rvstq/wrmm/nlwpspl/bmmmhnbc/dmj"=>166520, "//rvstq/wrmm/nlwpspl/bmmmhnbc/dmj/bqg"=>379291, "//rvstq/wrmm/nlwpspl/bmmmhnbc/dmj/rhd"=>353728, "//rvstq/wrmm/nlwpspl/bmmmhnbc/hztjntff"=>428284, "//rvstq/wrmm/nlwpspl/bmmmhnbc/hztjntff/mczrpf"=>575675, "//rvstq/wrmm/nlwpspl/bmmmhnbc/hztjntff/mzd"=>26174, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq"=>192879, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff"=>579238, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff/bqg"=>14092, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff/vhdqhfqv"=>350269, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff/wrmm"=>530638, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff/wrmm/grlgcgrl"=>164027, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff/wrmm/nmm"=>101722, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/hztjntff/wrmm/tlrztbh"=>213889, "//rvstq/wrmm/nlwpspl/bmmmhnbc/wmgwfvq/rvwhms"=>314729, "//rvstq/wrmm/nlwpspl/jjjdlj/dnpf"=>258139, "//rvstq/wrmm/nlwpspl/jjjdlj/mwlvndml"=>255297, "//rvstq/wrmm/nlwpspl/jjjdlj/mwlvndml/nzdgz"=>111500, "//rvstq/wrmm/nlwpspl/vctf"=>998580, "//rvstq/wrmm/nlwpspl/vctf/bqg"=>219667, "//rvstq/wrmm/nlwpspl/vctf/gcgqr"=>71948, "//rvstq/wrmm/nlwpspl/vctf/vbqjbq/sltqnp"=>329159, "//rvstq/wrmm/qwvjnwsf"=>386684, "//rvstq/wrmm/qwvjnwsf/hqlv"=>250002, "//rvstq/wrsmnpwf"=>205662, "//sjt"=>327504, "//sjt/cwsf"=>448587, "//sjt/cwsf/dtpf"=>417193, "//sjt/cwsf/fjtsb"=>489881, "//sjt/cwsf/gdnnndj/sljmpls"=>414918, "//sjt/cwsf/gdnnndj/sljmpls/cnzhjqbm"=>196818, "//sjt/cwsf/gdnnndj/sljmpls/cttgctwb/bqg"=>270727, "//sjt/cwsf/gdnnndj/sljmpls/rwwmcmt"=>363451, "//sjt/cwsf/gdnnndj/zhn"=>114122, "//sjt/cwsf/gdnnndj/zhn/mpfvnslm/qvtr"=>83650, "//sjt/cwsf/gdnnndj/zhn/zlqns"=>36937, "//sjt/cwsf/mfbp"=>199935, "//sjt/cwsf/nzdgz"=>121541, "//sjt/cwsf/zclzqz"=>274497, "//sjt/nzdgz/qscww"=>421186, "//sjt/nzdgz/tdthnm/hmq"=>172261, "//sjt/nzdgz/tdthnm/tcdm"=>188168, "//sjt/qsd/bqg"=>1068087, "//sjt/qsd/bqg/mnrrmcc"=>33961, "//sjt/qsd/pbfc/hwbdld"=>287013, "//sjt/rdzsr"=>45590, "//sjt/zgrf"=>496604, "//sjt/zgrf/bqg"=>188545, "//sjt/zgrf/cbc"=>379249, "//sjt/zgrf/cbc/dsmmcjtg"=>343038, "//sjt/zgrf/cbc/wrmm"=>207747, "//sjt/zgrf/cclw"=>245438, "//sjt/zgrf/cwsf"=>607626, "//sjt/zgrf/fph"=>313411, "//sjt/zgrf/fph/hztjntff"=>380534, "//sjt/zgrf/fph/mbgv"=>890, "//sjt/zgrf/fph/nbzvd"=>95080, "//sjt/zgrf/fph/tzjtsqlj"=>224995, "//sjt/zgrf/hvvvv/zrpvfzz"=>280153, "//sjt/zgrf/hvvvv/zrpvfzz/nlcds"=>80960, "//sjt/zgrf/hztjntff"=>889707, "//sjt/zgrf/hztjntff/fwmvqhj"=>348874, "//sjt/zgrf/hztjntff/fwmvqhj/cwsf"=>552249, "//sjt/zgrf/hztjntff/fwmvqhj/hjgpzwf"=>157649, "//sjt/zgrf/hztjntff/fwmvqhj/njtbnt"=>31491, "//sjt/zgrf/hztjntff/fwmvqhj/njtbnt/lvhqrjzn"=>11465, "//sjt/zgrf/hztjntff/fwmvqhj/njtbnt/mgtjfhvf/wmnwrn"=>44518, "//sjt/zgrf/hztjntff/hnwn"=>265411, "//sjt/zgrf/hztjntff/hnwn/bqg"=>96072, "//sjt/zgrf/hztjntff/wrmm"=>925891, "//sjt/zgrf/hztjntff/wrmm/jgdjp"=>165322, "//sjt/zgrf/hztjntff/wrmm/qzlt"=>44763, "//sjt/zgrf/hztjntff/wrmm/qzlt/jcgt"=>199928, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/csvhwb"=>310870, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/csvhwb/hztjntff"=>270565, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/csvhwb/prqf"=>782438, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/mnwwdf"=>161210, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/pzwvh"=>53844, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/pzwvh/jbhjjjs"=>48808, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/pzwvh/lql/tzcjpj"=>101686, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/pzwvh/wcrsqtz"=>342519, "//sjt/zgrf/hztjntff/wrmm/qzlt/vmsnrhb/pzwvh/wcrsqtz/rngvpc"=>220454, "//sjt/zgrf/hztjntff/wrmm/qzlt/wrmm/mvrqsc"=>507506, "//sjt/zgrf/hztjntff/wrmm/tmzgrts"=>361038, "//sjt/zgrf/hztjntff/wrmm/tmzgrts/jrbjdghc"=>85458, "//sjt/zgrf/tqqqv"=>358797, "//sjt/zgrf/tqqqv/qmwpfp/cwsf"=>546237, "//sjt/zgrf/tqqqv/qmwpfp/cwsf/wlpcb"=>280918, "//sjt/zgrf/tqqqv/qmwpfp/lndh"=>433170, "//sjt/zgrf/tqqqv/qmwpfp/nvjsvvln"=>288486, "//sjt/zmtmr"=>285763, "//sjt/zmtmr/sms"=>283543, "//sjt/zmtmr/vdn"=>327156, "//sjt/zmtmr/vdqmtjw"=>291828, "//wrmm"=>366424}
